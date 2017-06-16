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

class Section {

    private(set) var title: String
    private(set) var programs: [Program]

    init(title: String, shows: [Program]) {
        self.title = title
        self.programs = shows
    }

}
