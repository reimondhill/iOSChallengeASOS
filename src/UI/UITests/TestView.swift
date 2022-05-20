//
//  TestView.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import UIKit
@testable import UI

class TestView: UIView {
    //MARK: - Properties
    private (set) lazy var loadingIndicator: UIActivityIndicatorView = {
       return UIActivityIndicatorView()
    }()
    
    //MARK: - Constructor
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - ReusableView implementation
extension TestView: ReusableView {}


//MARK: - LoaderDisplayable implementation
extension TestView: LoaderDisplayable {}
