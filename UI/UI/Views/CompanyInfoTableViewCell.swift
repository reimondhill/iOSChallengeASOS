//
//  CompanyInfoTableViewCell.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit
import Presentation

public class CompanyInfoTableViewCell: UITableViewCell {
    //MARK: - Properties
    //MARK: UI
    private lazy var titleLabel: BaseLabel = {
        let view = BaseLabel(style: .body)
        
        view.numberOfLines = 0
        
        return view
    }()
    
    
    //MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Lifecycle methods
extension CompanyInfoTableViewCell {
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
}


//MARK: - Private methods
private extension CompanyInfoTableViewCell {
    func setupUI() {
        backgroundColor = .clear
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.left.bottom.right.equalToSuperview().inset(Padding.medium)
        }
    }
}


//MARK: - LaunchPresentableItem implementation
extension CompanyInfoTableViewCell: CompanyInfoPresentableItem {
    public func setup(companyInfo: String) {
        titleLabel.text = companyInfo
    }
}

