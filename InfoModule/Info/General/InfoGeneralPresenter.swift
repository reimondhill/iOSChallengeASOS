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


public enum InfoGeneralPresenterCellType {
    case info
    case launch
}

public protocol InfoGeneralPresenterInterface: ListPresesnter {
    func setup(header: HeaderPresentableItem, section: Int)
    
    func cellType(indexPath: IndexPath) -> InfoGeneralPresenterCellType
    
    func setup(cell: LaunchPresentableItem, indexPath: IndexPath)
    
    func setup(cell: CompanyInfoPresentableItem, indexPath: IndexPath)
}

public protocol InfoGeneralPresenterOutput: ViewReloader {}


class InfoGeneralPresenter {
    //MARK: - Properties
    private let companyFetcher: CompanyInfoFetcherInterface
    private let launchesFetcher: LaunchesFetcherInterface
    private let rocketFetcher: RocketFetcherInterface
    private let router: InfoGeneralRouterInterface & WebRouter
    
    private let queue = DispatchQueue(label: "InfoGeneralPresenter", qos: .background, attributes: [])
    
    public weak var view: (InfoGeneralPresenterOutput & ProcessingDisplayable)?
    
    private var isProcessing: Bool = false {
        didSet {
            if isProcessing != oldValue {
                view?.processingDisplayable(isProcessing: isProcessing)
            }
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
         router: InfoGeneralRouterInterface & WebRouter) {
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
        queue.sync {
            var allSucces: [Bool] = [Bool].init(repeating: true, count: 0)
            let queue = OperationQueue()
            
            queue.addOperation { [weak self] in
                self?.fetchCompanyInfo { [weak self] result in
                    guard let self = self else {
                        return
                    }
                    
                    switch result {
                    case .success(let companyInfo):
                        self.companyInfo = companyInfo
                        print("Hey company")
                    case .failure(let error):
                        print(error.localizedDescription)
                        allSucces[0] = false
                    }
                }
            }
            
            queue.addOperation { [weak self] in
                self?.fetchLaunches(completion: { [weak self] result in
                    guard let self = self else {
                        return
                    }
                    
                    switch result {
                    case .success(let launches):
                        self.launches = launches
                        print("Hey launches")
                    case .failure(let error):
                        print(error.localizedDescription)
                        allSucces[1] = false
                    }
                })
            }
            
            print("Hey waiting")
            queue.waitUntilAllOperationsAreFinished()
            print("Hey there")
            completion(allSucces.filter({ $0 == true }).count == 0)
        }
    }
}


//MARK: - Public methods
//MARK: - InfoGeneralPresenter implementation
extension InfoGeneralPresenter: InfoGeneralPresenterInterface {
    //MARK: Presenter
    func viewDidLoad() {
        
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
            guard let links = launches?[safe: indexPath.row]?.links,
                  let url = links.articleURL ?? links.wikipediaURL ?? links.webcastURL else {
                return
            }
            
            router.route(url: url, type: .external)
        default:
            return
        }
    }
    
    
    //MARK: InfoGeneralPresenterInterface implementation
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
        
        cell.setup(launchItem: launch)
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
