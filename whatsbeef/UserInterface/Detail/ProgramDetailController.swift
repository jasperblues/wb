////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import UIKit

class ProgramDetailController: UIViewController {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var ratingLogo: UIImageView?

    private(set) var show: Show

    init(show: Show) {
        self.show = show
        super.init(nibName: "ProgramDetailView", bundle: .main)
        self.title = show.name
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel?.text = show.name
        titleLabel?.sizeToFit()
        timeLabel?.text = show.timeDescription
        ratingLogo?.image = show.ratingImage
    }


}
