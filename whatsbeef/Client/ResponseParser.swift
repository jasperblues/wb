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
import SwiftyJSON

class ResponseParser {


    func parse(response: String) -> Array<Show> {
        return parse(response: response.data(using: .utf8)!)
    }

    /**
    * Parses the UTF-8 encoded data.
    */
    func parse(response: Data) -> Array<Show> {

        var items : Array<Show> = []
        let json = JSON(data: response)

        for (_, item): (String, JSON) in json["results"] {

            let show = Show(rating: item["rating"].string!,
                    channel: item["channel"].string!,
                    name: item["name"].string!,
                    startTime: item["start_time"].string!,
                    endTime: item["end_time"].string!)
            items.append(show)
        }

        return items
    }
}
