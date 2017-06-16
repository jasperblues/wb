////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import UIKit
import NanoFrame

class ProgramTableCell: UITableViewCell {

    private(set) var channelLogo: UIImageView?
    private(set) var titleLabel: UILabel?
    private(set) var timeLabel: UILabel?
    private(set) var ratingLogo: UIImageView?
    private(set) var loader: UIView?
    private(set) var activityIndicator: UIActivityIndicatorView?
    private(set) var separator: UIView?

    var program: Program? {
        didSet {
            if (program != nil) {
                titleLabel?.text = program!.name
                timeLabel?.text = program!.timeDescription
                channelLogo?.image = program!.channelImage
                ratingLogo?.image = program!.ratingImage
                loader?.isHidden = true
            }
            else {
                loader?.isHidden = false
                activityIndicator?.startAnimating()
            }
        }
    }

    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupChannelLogo()
        self.setupTitleLabel()
        self.setupTimeLabel()
        self.setupRatingLogo()
        self.setupSeparator()
        self.setupLoader()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: NSCoder has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel?.text = nil
        timeLabel?.text = nil
        channelLogo?.image = nil
        ratingLogo?.image = nil
        activityIndicator?.startAnimating()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        channelLogo!.centerVertically(in: self.contentView.bounds)
        channelLogo!.x = 10

        titleLabel!.width = 200
        titleLabel!.centerVertically(in: self.contentView.bounds)
        titleLabel!.x = channelLogo!.right + 10
        titleLabel!.y -= 12

        timeLabel!.width = titleLabel!.width
        timeLabel!.centerVertically(in: self.contentView.bounds)
        timeLabel!.x = titleLabel!.x
        timeLabel!.y += 12

        ratingLogo!.right = self.contentView.right - 10
        ratingLogo!.y = 8

        separator!.height = 1
        separator!.width = self.contentView.width - 70
        separator!.x = 70
        separator!.y = self.contentView.bottom - 1

        loader!.frame = self.contentView.bounds
        activityIndicator!.centerInSuperView()
    }

    private func setupChannelLogo() {
        let fixedSize = CGRect(x: 0, y: 0, width: 55, height: 55)
        channelLogo = UIImageView()
        channelLogo!.frame = fixedSize
        self.contentView.addSubview(channelLogo!)
    }

    private func setupTitleLabel() {
        let fixedHeight = CGRect(x: 0, y: 0, width: 0, height: 25)
        titleLabel = UILabel(frame: fixedHeight)
        titleLabel!.font = .boldSystemFont(ofSize: 16)
        titleLabel!.textColor = .darkText
        titleLabel!.textAlignment = .left
        titleLabel!.backgroundColor = .clear

        titleLabel!.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(titleLabel!)
    }

    private func setupTimeLabel() {
        let fixedHeight = CGRect(x: 0, y: 0, width: 0, height: 20)
        timeLabel = UILabel(frame: fixedHeight)
        timeLabel!.font = .systemFont(ofSize: 14)
        timeLabel!.textColor = .darkText
        timeLabel!.textAlignment = .left
        timeLabel!.backgroundColor = .clear

        timeLabel!.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(timeLabel!)
    }

    private func setupRatingLogo() {
        let fixedSize = CGRect(x: 0, y: 0, width: 33, height: 33)
        ratingLogo = UIImageView()
        ratingLogo!.frame = fixedSize
        ratingLogo!.contentMode = .scaleAspectFit
        self.contentView.addSubview(ratingLogo!)
    }

    private func setupLoader() {
        loader = UIView(frame: CGRect(x:0, y:0, width:0, height: 0))
        loader!.backgroundColor = .darkGray
        loader!.alpha=0.5
        loader!.layer.cornerRadius = 4

        activityIndicator = UIActivityIndicatorView()
        activityIndicator!.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator!.startAnimating()
        loader!.addSubview(activityIndicator!)
        activityIndicator!.centerInSuperView()

        self.contentView.addSubview(loader!)
    }

    private func setupSeparator() {
        separator = UIView()
        separator!.backgroundColor = UIColor(hex: "f0f0f0")
        self.contentView.addSubview(separator!)
    }

}
