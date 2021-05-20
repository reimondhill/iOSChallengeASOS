//
//  BaseStackView.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

class BaseStackView: UIStackView {
    //MARK: - Properties
    
    
    //MARK: - Constructor
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseStackView {
    func setupUI() {
        spacing = Padding.xSmall
    }
}
