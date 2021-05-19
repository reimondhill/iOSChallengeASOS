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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    //MARK: UI
    lazy private var indicatorView: BaseLoaderIndicator = {
        let view = BaseLoaderIndicator()
        
        return view
    }()
    
    lazy private var tableView: BaseTableView = {
        let view = BaseTableView()
        
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = UITableView.automaticDimension
        
        view.register(header: ReusableTableViewHeaderFooter.self)
        view.registerEmptyCell()
        view.register(CompanyInfoTableViewCell.self)
        view.register(LaunchItemTableViewCell.self)
        
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
        view.backgroundColor = UIColor.primaryBackgroundColor
        title = LocalisedStrings.companyInfoTitle
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
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
            return cell
        case .launch:
            let cell: LaunchItemTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            presenter.setup(cell: cell, indexPath: indexPath)
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
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 150
        }
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
