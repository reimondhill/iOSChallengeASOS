//
//  LaunchItemTableViewCell.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit
import Core
import Presentation

import SnapKit
import SDWebImage

public class LaunchItemTableViewCell: UITableViewCell {
    //MARK: - Class model
    struct Style {
        static let wrapperViewInsets: UIEdgeInsets = .init(top: Padding.small, left: Padding.medium, bottom: Padding.medium, right: Padding.medium)
        static let missionImageViewSize: CGSize = .init(width: 32, height: 32)
        static let statusImageViewSize: CGSize = .init(width: 48, height: 48)
        static let infoStackViewInsets: UIEdgeInsets = .init(top: 0, left: Padding.medium, bottom: 0, right: Padding.medium)
    }
    
    //MARK: - Properties
    //MARK: UI
    private lazy var wrapperView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        
        return view
    }()
    
    private lazy var missionImageView: BaseImageView = {
        let view = BaseImageView()
        
        return view
    }()
    
    private lazy var statusImageView: BaseImageView = {
        let view = BaseImageView()
        
        return view
    }()
    
    private lazy var infoStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        
        view.addArrangedSubview(missionItemStackView)
        view.addArrangedSubview(dateItemStackView)
        view.addArrangedSubview(rocketItemStackView)
        view.addArrangedSubview(daysItemStackView)
        
        return view
    }()
    
    private lazy var missionItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        
        view.addArrangedSubview(missionTitleLabel)
        view.addArrangedSubview(missionLabel)
        
        return view
    }()
    private lazy var missionTitleLabel: BaseLabel = {
        let view = BaseLabel()
        
        view.text = LocalisedStrings.missionTitle
        
        return view
    }()
    private lazy var missionLabel: BaseLabel = {
        let view = BaseLabel()
        
        return view
    }()
    
    private lazy var dateItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        
        view.addArrangedSubview(dateTitleLabel)
        view.addArrangedSubview(dateLabel)
        
        return view
    }()
    private lazy var dateTitleLabel: BaseLabel = {
        let view = BaseLabel()
        
        view.text = LocalisedStrings.dateTitle
        
        return view
    }()
    private lazy var dateLabel: BaseLabel = {
        let view = BaseLabel()
        
        return view
    }()
    
    private lazy var rocketItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        
        view.addArrangedSubview(rocketTitleLabel)
        view.addArrangedSubview(rocketLabel)
        
        return view
    }()
    private lazy var rocketTitleLabel: BaseLabel = {
        let view = BaseLabel()
        
        view.text = LocalisedStrings.rocketTitle
        
        return view
    }()
    private lazy var rocketLabel: BaseLabel = {
        let view = BaseLabel()
        
        return view
    }()
    
    private lazy var daysItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        
        view.addArrangedSubview(daysTitleLabel)
        view.addArrangedSubview(daysLabel)
        
        return view
    }()
    private lazy var daysTitleLabel: BaseLabel = {
        let view = BaseLabel()
        
        view.text = LocalisedStrings.dateDays
        
        return view
    }()
    private lazy var daysLabel: BaseLabel = {
        let view = BaseLabel()
        
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
extension LaunchItemTableViewCell {
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        missionImageView.image = nil
        statusImageView.image = nil
    }
}


//MARK: - Private methods
private extension LaunchItemTableViewCell {
    func setupUI() {
        addSubview(wrapperView)
        wrapperView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(Style.wrapperViewInsets)
        }
        
        wrapperView.addSubview(missionImageView)
        missionImageView.snp.makeConstraints { maker in
            maker.top.left.equalToSuperview()
            maker.size.equalTo(Style.missionImageViewSize)
        }
        
        wrapperView.addSubview(statusImageView)
        statusImageView.snp.makeConstraints { maker in
            maker.top.right.equalToSuperview()
            maker.size.equalTo(Style.statusImageViewSize)
        }
        
        wrapperView.addSubview(infoStackView)
        infoStackView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(Style.infoStackViewInsets.top)
            maker.left.equalTo(missionImageView.snp.right).inset(-Style.infoStackViewInsets.left)
            maker.right.equalTo(statusImageView.snp.left).inset(-Style.infoStackViewInsets.right)
        }
    }
}


//MARK: - LaunchPresentableItem implementation
extension LaunchItemTableViewCell: LaunchPresentableItem {
    public func setup(launchItem: Launch) {
        missionImageView.sd_setImage(with: URL(string: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png"))
        statusImageView.image = UIImage(named: "SuccessIcon", in: Bundle(for: LaunchItemTableViewCell.self), compatibleWith: nil)
        
        missionLabel.text = "MMM"
        dateLabel.text = "TO"
        rocketLabel.text = "ROO"
        daysLabel.text = "-1"
    }
}
