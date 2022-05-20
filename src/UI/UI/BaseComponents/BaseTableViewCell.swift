//
//  BaseTableViewCell.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseTableViewCell: UITableViewCell {
    var configuration: BaseTableViewCell.Configuration = .default {
        didSet {
            setupUI(configuration: configuration)
        }
    }
    
    //MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseTableViewCell {
    func setupUI(configuration: BaseTableViewCell.Configuration) {
        backgroundColor = configuration.backgroundColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = configuration.selectedBackgroundColor
        selectedBackgroundView = backgroundView
    }
}


//MARK: - Configuration
public extension BaseTableViewCell {
    struct Configuration {
        public let backgroundColor: UIColor
        public let selectedBackgroundColor: UIColor
    }
}

//MARK: Defined Configurations
public extension BaseTableViewCell.Configuration {
    static let `default`: BaseTableViewCell.Configuration = {
        
        return BaseTableViewCell.Configuration(backgroundColor: UIColor.primaryBackground,
                                               selectedBackgroundColor: UIColor.secondaryBackground)
    }()
}

