//
//  TestViewController.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import UIKit
@testable import UI
@testable import Presentation

class TestViewController: UIViewController {
    //MARK: - Properties
    private (set) lazy var loadingIndicator: UIActivityIndicatorView = {
       return UIActivityIndicatorView()
    }()
    
    //MARK: - Constructor
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - LoaderDisplayable implementation
extension TestViewController: LoaderDisplayable {}

extension TestViewController: ProcessingDisplayable {}
