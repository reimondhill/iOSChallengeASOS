//
//  InfoGeneralViewController.swift
//  Info
//
//  Created by Ramon Haro Marques on 18/05/2021.
//

import UIKit

class InfoGeneralViewController: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}
