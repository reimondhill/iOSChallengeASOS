//
//  InfoGeneralPresenter.swift
//  Info
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core
import Data
import Routing
import Presentation

public enum InfoGeneralPresenterSorting {
    case ascending
    case descending
}

public enum InfoGeneralPresenterCellType {
    case info
    case launch
}

public protocol InfoGeneralPresenterInterface: ListPresesnter {
    var sortingOrder: InfoGeneralPresenterSorting { get }
    
    func showOrderList()
    
    func showFilterList()
    
    func setup(header: HeaderPresentableItem, section: Int)
    
    func cellType(indexPath: IndexPath) -> InfoGeneralPresenterCellType
    
    func setup(cell: LaunchPresentableItem, indexPath: IndexPath)
    
    func setup(cell: CompanyInfoPresentableItem, indexPath: IndexPath)
}

public protocol InfoGeneralPresenterOutput: ViewReloader {
    func infoGeneralPresenterOutput(sortingOrderChanged sortingOrder: InfoGeneralPresenterSorting)
}


class InfoGeneralPresenter {
    //MARK: - Properties
    private let companyFetcher: CompanyInfoFetcherInterface
    private let launchesFetcher: LaunchesFetcherInterface
    private let rocketFetcher: RocketFetcherInterface
    private let router: InfoGeneralRouterInterface & ErrorRouter & WebRouter
    
    private let queue = DispatchQueue(label: "InfoGeneralPresenter", qos: .background, attributes: [])
    
    public weak var view: (InfoGeneralPresenterOutput & ProcessingDisplayable)?
    
    private var isProcessing: Bool = false {
        didSet {
            if isProcessing != oldValue {
                view?.processingDisplayable(isProcessing: isProcessing)
            }
        }
    }
    
    private var _sortingOrder: InfoGeneralPresenterSorting = .descending {
        didSet {
            guard _sortingOrder != oldValue else {
                return
            }
            
            view?.infoGeneralPresenterOutput(sortingOrderChanged: _sortingOrder)
            launches = sort(launches: launches, sortingOrder: _sortingOrder)
        }
    }
    private (set) var yearFilter: String? {
        didSet {
            view?.viewReloaderReloadView()
        }
    }
    
    private var companyInfo: CompanyInfo? {
        didSet {
            if companyInfo != oldValue {
                view?.viewReloaderReloadView()
            }
        }
    }
    
    private var launches: [Launch]? {
        didSet {
            if launches != oldValue {
                view?.viewReloaderReloadView()
            }
        }
    }
    
    
    //MARK: - Constructor
    init(companyFetcher: CompanyInfoFetcherInterface,
         launchesFetcher: LaunchesFetcherInterface,
         rocketFetcher: RocketFetcherInterface,
         router: InfoGeneralRouterInterface & ErrorRouter & WebRouter) {
        self.companyFetcher = companyFetcher
        self.launchesFetcher = launchesFetcher
        self.rocketFetcher = rocketFetcher
        self.router = router
    }
}


//MARK: - Private methods
private extension InfoGeneralPresenter {
    func fetchCompanyInfo(completion: @escaping (Result<CompanyInfo, Error>) -> Void) {
        companyFetcher.getInfo(completion: completion)
    }
    
    func fetchLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        launchesFetcher.getLaunch(completion: completion)
    }
    
    func fetchAllAndOrganise(completion: @escaping (Bool)->Void) {
        queue.async {
            var allSucces: [Bool] = [Bool].init(repeating: true, count: 2)
            var allFinish: [Bool] = [Bool].init(repeating: false, count: 2)
            
            self.fetchCompanyInfo { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result {
                case .success(let companyInfo):
                    self.companyInfo = companyInfo
                case .failure(let error):
                    print(error.localizedDescription)
                    allSucces[0] = false
                }
                
                allFinish[0] = true
            }
            
            self.fetchLaunches(completion: { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result {
                case .success(let launches):
                    self.launches = self.sort(launches: launches, sortingOrder: self._sortingOrder)
                case .failure(let error):
                    print(error.localizedDescription)
                    allSucces[1] = false
                }
                allFinish[1] = true
            })
            
            while allFinish.filter({ $0 == false }).count > 0 {
                usleep(100000)
            }
            
            completion(allSucces.filter({ $0 == true }).count == 0)
        }
    }
    
    func sort(launches: [Launch]?, sortingOrder: InfoGeneralPresenterSorting) -> [Launch] {
        guard let launches = launches else {
            return []
        }
        
        switch _sortingOrder {
        case .ascending:
            return launches.sorted(by: { $0.dateEpoch ?? 0 < $1.dateEpoch ?? 0 } )
        case .descending:
            return launches.sorted(by: { $0.dateEpoch ?? 0 > $1.dateEpoch ?? 0 } )
        }
    }
}


//MARK: - Public methods
//MARK: - InfoGeneralPresenter implementation
extension InfoGeneralPresenter: InfoGeneralPresenterInterface {
    //MARK: Presenter
    func viewDidLoad() {
        view?.viewReloaderReloadView()
        view?.infoGeneralPresenterOutput(sortingOrderChanged: _sortingOrder)
    }
    
    func reload(silently: Bool) {
        if !silently {
            isProcessing = true
        }
        
        fetchAllAndOrganise(completion: { [weak self] success in
            guard let self = self else {
                return
            }
            
            if !silently {
                self.isProcessing = false
            }
        })
        
    }
    
    
    //MARK: ListPresesnter
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfItems(section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return launches?.count ?? 0
        default:
            return 0
        }
    }
    
    func canShowHeader(section: Int) -> Bool {
        headerTitle(section: section) != nil
    }
    
    func headerTitle(section: Int) -> String? {
        switch section {
        case 0:
            return LocalisedStrings.headerTitleCompany
        case 1:
            return LocalisedStrings.headerTitleLaunches
        default:
            return nil
        }
    }
    
    func canSelect(indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    
    func didSeclect(indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            guard let links = launches?[safe: indexPath.row]?.links else {
                router.showError(title: LocalisedStrings.error, message: LocalisedStrings.errorNoURLsAvailable)
                return
            }
            
            var options: [(String,URL)] = []
            if let articleURL = links.articleURL {
                options.append(("Article", articleURL))
            }
            
            if let wikipediaURL = links.wikipediaURL {
                options.append(("Wikipedia", wikipediaURL))
            }
            
            if let webcastURL = links.webcastURL {
                options.append(("WebCast", webcastURL))
            }
            
            guard options.count > 0 else {
                router.showError(title: LocalisedStrings.error, message: LocalisedStrings.errorNoURLsAvailable)
                return
            }
            
            router.routeSelectorModule(options: options.map({$0.0}), title: LocalisedStrings.urlSelectTitle) { [options, weak self] indexSelected in
                guard let self = self,
                      let url = options[safe: indexSelected]?.1 else {
                    return
                }
                
                self.router.route(url: url, type: .safariView)
            }
            
        default:
            return
        }
    }
    
    
    //MARK: InfoGeneralPresenterInterface implementation
    var sortingOrder: InfoGeneralPresenterSorting {
        _sortingOrder
    }
    
    func showOrderList() {
        switch _sortingOrder {
        case .ascending:
            _sortingOrder  = .descending
        case .descending:
            _sortingOrder = .ascending
        }
    }
    
    func showFilterList() {
        guard let launches = launches else {
            return
        }
        
        let years = launches
            .compactMap({ $0.dateEpoch })
            .map({ Date(timeIntervalSince1970: TimeInterval($0)) })
            .map({ $0.year })
            .unique
            .sorted(by: { $0 > $1 })
        
        router.routeSelectorModule(options: years, title: LocalisedStrings.yearSelectTitle, completion: { [years, weak self] selectedIndex in
            guard let self = self else {
                return
            }
            
            guard let value = years[safe: selectedIndex] else {
                return
            }
            
            self.yearFilter = value
        })
    }
    
    func setup(header: HeaderPresentableItem, section: Int) {
        header.set(title: headerTitle(section: section))
    }
    
    func cellType(indexPath: IndexPath) -> InfoGeneralPresenterCellType {
        if indexPath.section == 0 {
            return .info
        } else {
            return .launch
        }
    }
    
    func setup(cell: LaunchPresentableItem, indexPath: IndexPath) {
        guard let launch = launches?[safe: indexPath.row] else {
            return
        }
        
        cell.setup(launchItem: LaunchPresentableItemInfo(launch: launch))
    }
    
    func setup(cell: CompanyInfoPresentableItem, indexPath: IndexPath) {
        guard let companyInfo = companyInfo else {
            return
        }
        
        let message = String(format: LocalisedStrings.companyInfoDescription,
                             companyInfo.name,
                             companyInfo.founder,
                             String(companyInfo.founded),
                             String(companyInfo.employees),
                             String(companyInfo.launchSites),
                             String(companyInfo.valuation))
        
        cell.setup(companyInfo: message)
    }
}
