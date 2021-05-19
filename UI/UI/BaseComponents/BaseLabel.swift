//
//  BaseLabel.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseLabel: UILabel {
    //MARK: - Properties
    
    
    //MARK: - Constructor
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseLabel {
    func setupUI() {
        numberOfLines = 1
        textAlignment = .justified
        //STYLE HERE!!!
    }
}
