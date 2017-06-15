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

class Guide {

    private (set) var sections: [Section] = []

    func addIfRequired(section: Section) {
        let filter = sections.filter { $0.title == section.title }
        if (filter.count == 0) {
            sections.append(section)
        }
    }

    func maxIndexPath() -> IndexPath {
        if (sections.count == 0) {
            return IndexPath(row: 0, section: 0)
        }
        let maxSection = sections.count - 1
        let section = sections[maxSection]
        let maxRow = section.programs.count - 1
        return IndexPath(row: maxRow, section: maxSection)
    }

}
