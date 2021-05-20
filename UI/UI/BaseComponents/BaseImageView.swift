//
//  BaseImageView.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

class BaseImageView: UIImageView {
    //MARK: - Properties
    
    
    //MARK: - Constructor
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseImageView {
    func setupUI() {
        contentMode = .scaleAspectFit
    }
}
