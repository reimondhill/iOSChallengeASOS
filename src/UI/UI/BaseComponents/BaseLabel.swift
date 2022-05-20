//
//  BaseLabel.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class BaseLabel: UILabel {
    //MARK: - Class Model
    public enum Style: CaseIterable {
        case title
        case body
        case bodyBold
        case bodySecondary
    }
    
    
    //MARK: - Properties
    var style: Style {
        didSet {
            update(style: style)
        }
    }
    
    //MARK: - Constructor
    public init(style: Style) {
        self.style = style
        
        super.init(frame: .zero)
        setupUI()
        update(style: style)
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
    }
    
    func update(style: Style) {
        switch style {
        case .title:
            font = UIFont.title
            textColor = UIColor.primaryText
            highlightedTextColor = UIColor.secondaryText
        case .body:
            font = UIFont.body
            textColor = UIColor.primaryText
            highlightedTextColor = UIColor.secondaryText
        case .bodyBold:
            font = UIFont.bodyBold
            textColor = UIColor.primaryText
            highlightedTextColor = UIColor.secondaryText
        case .bodySecondary:
            font = UIFont.body
            textColor = UIColor.secondaryText
            highlightedTextColor = UIColor.secondaryText
        }
    }
}
