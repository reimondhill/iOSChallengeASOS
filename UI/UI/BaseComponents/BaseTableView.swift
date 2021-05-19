//
//  BaseTableView.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseTableView: UITableView {
    //MARK: - Properties
    
    
    //MARK: - Constructor
    public init() {
        super.init(frame: .zero, style: .plain)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension BaseTableView {
    func setupUI() {
        backgroundColor = .clear
        tableFooterView = UIView()
    }
}
