//
//  InfoGeneralViewController.swift
//  Info
//
//  Created by Ramon Haro Marques
//

import UIKit
import Presentation
import UI

import SnapKit


class InfoGeneralViewController: UIViewController {
    //MARK: - Properties
    var presenter: InfoGeneralPresenterInterface?
    
    private let refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        
        control.tintColor = UIColor.primaryText
        
        return control
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    
    //MARK: UI
    private lazy var filterButton: UIBarButtonItem = {
        let view: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "FilterIcon", in: Constants.bundle, compatibleWith: nil), style: .plain, target: self, action: #selector(filterButtonClicked))
        
        return view
    }()
    
    private lazy var orderButton: UIBarButtonItem = {
        let view: UIBarButtonItem = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(orderButtonClicked))
        
        return view
    }()
    
    private lazy var indicatorView: BaseLoaderIndicator = {
        let view = BaseLoaderIndicator()
        
        return view
    }()
    
    private lazy var tableView: BaseTableView = {
        let view = BaseTableView()
        
        view.register(header: ReusableTableViewHeaderFooter.self)
        view.registerEmptyCell()
        view.register(CompanyInfoTableViewCell.self)
        view.register(LaunchItemTableViewCell.self)
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        view.addSubview(refreshControl)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Lifecycle methods
extension InfoGeneralViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter?.reload(silently: false)
    }
}


//MARK: - Private methods
private extension InfoGeneralViewController {
    func setupUI() {
        view.backgroundColor = UIColor.primaryBackground
        title = LocalisedStrings.companyInfoTitle
        
        navigationItem.setRightBarButtonItems([orderButton, filterButton], animated: true)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    @objc func filterButtonClicked() {
        presenter?.showFilterList()
    }
    
    @objc func orderButtonClicked() {
        presenter?.showOrderList()
    }
    
    @objc func refreshControlAction() {
        presenter?.reload(silently: false)
        refreshControl.endRefreshing()
    }
}


//MARK: - LoaderDisplayable implementation
extension InfoGeneralViewController: LoaderDisplayable {
    var loadingIndicator: UIActivityIndicatorView {
        indicatorView
    }
}


//MARK: - InfoGeneralPresenterOutput implementation
extension InfoGeneralViewController: InfoGeneralPresenterOutput {
    //MARK: ViewReloader implementation
    func viewReloaderReloadView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func infoGeneralPresenterOutput(sortingOrderChanged sortingOrder: InfoGeneralPresenterSorting) {
        let imageName: String
        switch sortingOrder {
        case .ascending:
            imageName = "SortAscIcon"
        case .descending:
            imageName = "SortDescIcon"
        }
        orderButton.image = UIImage(named: imageName, in: Constants.bundle, compatibleWith: nil)
    }
}


//MARK: - ProcessingDisplayable implementation
extension InfoGeneralViewController: ProcessingDisplayable {}


//MARK: - UITableView methods
//MARK: UITableViewDataSource implementation
extension InfoGeneralViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else {
            return tableView.dequeueEmptyCell(forIndexPath: indexPath)
        }
        
        
        switch presenter.cellType(indexPath: indexPath) {
        case .info:
            let cell: CompanyInfoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            presenter.setup(cell: cell, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .launch:
            let cell: LaunchItemTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            presenter.setup(cell: cell, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
}

//MARK: UITableViewDataSource implementation
extension InfoGeneralViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let presenter = presenter,
              presenter.canShowHeader(section: section) else {
            return 0
        }
        
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presenter = presenter,
              presenter.canShowHeader(section: section) else {
            return nil
        }
        
        let header: ReusableTableViewHeaderFooter = tableView.dequeueReusableHeaderFooter(for: section)
        
        presenter.setup(header: header, section: section)
        
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let presenter = presenter else {
            return false
        }
        
        return presenter.canSelect(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSeclect(indexPath: indexPath)
    }
}
