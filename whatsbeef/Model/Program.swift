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

class Show {

    var timeDescription: String {
        return "\(startTime) - \(endTime)"
    }

    /**
    * Map image resources statically.
    */
    var channelImage: UIImage {
        switch channel {
        case "Seven":
            return R.image.stationSeven()!
        case "7Mate":
            return R.image.station7Mate()!
        case "7TWO":
            return R.image.station7Two()!
        case "ABC1":
            return R.image.stationABC1()!
        case "Nine":
            return R.image.stationNine()!
        case "SBS One":
            return R.image.stationSBS1()!
        case "SBS Two", "SBS 2":
            return R.image.stationSBS2()!
        case "TEN":
            return R.image.station10()!
        case "ELEVEN":
            return R.image.stationEleven()!
        default:
            print("WARNING: No image resource for channel \(channel)")
            return UIImage()
        }
    }

    /**
    * Map image resources statically.
    */
    var ratingImage: UIImage {
        switch rating {
        case "M":
            return R.image.ratingM()!
        case "PG":
            return R.image.ratingPG()!
        case "MA":
            return R.image.ratingMA()!
        case "AV":
            return R.image.ratingAV()!
        case "G":
            return R.image.ratingG()!
        case "NR":
            return R.image.ratingNR()!
        default:
            print("No image resource for rating \(rating)")
            return R.image.ratingNR()!
        }
    }

    private(set) var rating: String
    private(set) var channel: String
    private(set) var name: String
    private(set) var startTime: String
    private(set) var endTime: String

    init(rating: String, channel: String, name: String, startTime: String, endTime: String) {

        self.rating = rating
        self.channel = channel
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }


}
