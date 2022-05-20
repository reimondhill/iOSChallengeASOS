//
//  BaseTableView.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseTableView: UITableView {
    //MARK: - Properties
    var configuration: BaseTableView.Configuration {
        didSet {
            setupUI(configuration: configuration)
        }
    }
    
    //MARK: - Constructor
    public init(configuration: BaseTableView.Configuration = .default) {
        self.configuration = configuration
        super.init(frame: .zero, style: .plain)
        
        setupUI(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseTableView {
    func setupUI(configuration: BaseTableView.Configuration) {
        backgroundColor = configuration.backgroundColor
    }
}


//MARK: - Configuration
public extension BaseTableView {
    struct Configuration {
        public let backgroundColor: UIColor
    }
}

//MARK: Defined Configurations
public extension BaseTableView.Configuration {
    static let `default`: BaseTableView.Configuration = {
        
        return BaseTableView.Configuration(backgroundColor: UIColor.clear)
    }()
}
