//
//  BaseStackView.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseStackView: UIStackView {
    //MARK: - Properties
    var configuration: BaseStackView.Configuration {
        didSet {
            setupUI(configuration: configuration)
        }
    }
    
    //MARK: - Constructor
    public init(configuration: BaseStackView.Configuration = .default) {
        self.configuration = configuration
        super.init(frame: .zero)
        
        setupUI(configuration: configuration)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseStackView {
    func setupUI(configuration: BaseStackView.Configuration) {
        spacing = configuration.spacing
    }
}


//MARK: - Configuration
public extension BaseStackView {
    struct Configuration {
        public let spacing: CGFloat
    }
}

//MARK: Defined Configurations
public extension BaseStackView.Configuration {
    static let `default`: BaseStackView.Configuration = {
        
        return BaseStackView.Configuration(spacing: Padding.xSmall)
    }()
}
