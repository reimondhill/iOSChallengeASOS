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

public class LaunchItemTableViewCell: BaseTableViewCell {
    //MARK: - Class model
    struct Style {
        static let wrapperViewInsets: UIEdgeInsets = .init(top: Padding.small, left: Padding.small, bottom: Padding.medium, right: Padding.small)
        static let missionImageViewSize: CGSize = IconSizes.large
        static let statusImageViewSize: CGSize = IconSizes.medium
        
        static let infoStackViewInsets: UIEdgeInsets = .init(top: 0, left: Padding.medium, bottom: 0, right: Padding.medium)
        static let infoStackVerticalSpacing: CGFloat = Padding.small
        static let infoStackHorizontalSpacing: CGFloat = Padding.small
    }
    
    //MARK: - Properties
    //MARK: UI
    private lazy var wrapperView: UIView = {
        let view = UIView()
        
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
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.spacing = Style.infoStackVerticalSpacing
        
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
        view.spacing = Style.infoStackHorizontalSpacing
        
        view.addArrangedSubview(missionTitleLabel)
        view.addArrangedSubview(missionLabel)
        
        return view
    }()
    private (set) lazy var missionTitleLabel: BaseLabel = {
        let view = BaseLabel(style: .bodyBold)
        
        view.text = "\(LocalisedStrings.missionTitle):"
        
        return view
    }()
    private (set) lazy var missionLabel: BaseLabel = {
        let view = BaseLabel(style: .body)
        
        return view
    }()
    
    private lazy var dateItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.spacing = Style.infoStackHorizontalSpacing
        
        view.addArrangedSubview(dateTitleLabel)
        view.addArrangedSubview(dateLabel)
        
        return view
    }()
    private (set) lazy var dateTitleLabel: BaseLabel = {
        let view = BaseLabel(style: .bodyBold)
        
        view.text = "\(LocalisedStrings.dateTimeTitle):"
        
        return view
    }()
    private (set) lazy var dateLabel: BaseLabel = {
        let view = BaseLabel(style: .body)
        
        return view
    }()
    
    private lazy var rocketItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.spacing = Style.infoStackHorizontalSpacing
        
        view.addArrangedSubview(rocketTitleLabel)
        view.addArrangedSubview(rocketLabel)
        
        return view
    }()
    private (set) lazy var rocketTitleLabel: BaseLabel = {
        let view = BaseLabel(style: .bodyBold)
        
        view.text = "\(LocalisedStrings.rocketTitle):"
        
        return view
    }()
    private (set) lazy var rocketLabel: BaseLabel = {
        let view = BaseLabel(style: .body)
        
        return view
    }()
    
    private lazy var daysItemStackView: BaseStackView = {
        let view = BaseStackView()
        
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.spacing = Style.infoStackHorizontalSpacing
        
        view.addArrangedSubview(daysTitleLabel)
        view.addArrangedSubview(daysLabel)
        
        return view
    }()
    private (set) lazy var daysTitleLabel: BaseLabel = {
        let view = BaseLabel(style: .bodyBold)
        
        view.text = "\(LocalisedStrings.days):"
        
        return view
    }()
    private (set) lazy var daysLabel: BaseLabel = {
        let view = BaseLabel(style: .body)
        
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
        
        missionLabel.text = nil
        dateLabel.text = nil
        rocketLabel.text = nil
        daysTitleLabel.text = "\(LocalisedStrings.days):"
        daysLabel.text = nil
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
            maker.bottom.equalToSuperview()
        }
    }
}


//MARK: - LaunchPresentableItem implementation
extension LaunchItemTableViewCell: LaunchPresentableItem {
    public func setup(launchItem: LaunchPresentableItemInfo) {
        if let logoURL = launchItem.logoImageURL {
            missionImageView.sd_setImage(with: logoURL)
        } else {
            missionImageView.image = UIImage(named: "RocketCircleLogo", in: Bundle(for: LaunchItemTableViewCell.self), compatibleWith: nil)
        }
        
        let imageConfiguration: (name: String, tintColor: UIColor)
        switch launchItem.status {
        case .succes:
            imageConfiguration = ("SuccessIcon", UIColor.success)
        case .failed:
            imageConfiguration = ("FailIcon", UIColor.error)
        case .unknown:
            imageConfiguration = ("UnknownIcon", UIColor.primaryText)
        }
        statusImageView.image = UIImage(named: imageConfiguration.name, in: Bundle(for: LaunchItemTableViewCell.self), compatibleWith: nil)
        statusImageView.tintColor = imageConfiguration.tintColor
        
        missionLabel.text = launchItem.mission
        dateLabel.text = launchItem.date
        rocketLabel.text = launchItem.rocket
        
        if launchItem.days < 0 {
            daysTitleLabel.text = "\(LocalisedStrings.daysSinceNow):"
            daysLabel.text = String(abs(launchItem.days))
        } else {
            daysTitleLabel.text = "\(LocalisedStrings.daysFromNow):"
            daysLabel.text = String(abs(launchItem.days))
        }
    }
}
