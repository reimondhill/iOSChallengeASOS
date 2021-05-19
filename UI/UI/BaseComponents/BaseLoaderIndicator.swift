//
//  BaseLoaderIndicator.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseLoaderIndicator: UIActivityIndicatorView {
    var configuration: BaseLoaderIndicator.Configuration {
        didSet {
            setupUI(configuration: configuration)
        }
    }
    
    public init(configuration: BaseLoaderIndicator.Configuration = .default) {
        self.configuration = configuration
        super.init(frame: .zero)
        
        setupUI(configuration: self.configuration)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(configuration: BaseLoaderIndicator.Configuration) {
        style = configuration.style
        color = configuration.color
        hidesWhenStopped = configuration.hidesWhenStopped
    }
}


//MARK: - Configuration
public extension BaseLoaderIndicator {
    struct Configuration {
        let style: UIActivityIndicatorView.Style
        let color: UIColor
        let hidesWhenStopped: Bool
    }
}

//MARK: Defined Configurations
public extension BaseLoaderIndicator.Configuration {
    static let `default`: BaseLoaderIndicator.Configuration = {
        let style: UIActivityIndicatorView.Style
        #if os(tvOS)
        if #available(tvOS 13.0, *) {
            style = .large
        } else {
            style = .white
        }
        #else
        style = .white
        #endif
        
        //STYLE HERE!!!
        return BaseLoaderIndicator.Configuration(style: style, color: UIColor.white, hidesWhenStopped: true)
    }()
}


