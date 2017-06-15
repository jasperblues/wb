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

extension UITableView {

    var lastIndexPath: IndexPath? {

        let lastSectionIndex = numberOfSections - 1
        guard lastSectionIndex >= 0 else { return nil }

        let lastIndexInLastSection = numberOfRows(inSection: lastSectionIndex) - 1
        guard lastIndexInLastSection >= 0 else { return nil }

        return IndexPath(row: lastIndexInLastSection, section: lastSectionIndex)
    }

    func maxVisiblePlusOne() -> IndexPath {
        let items: [IndexPath]? = self.indexPathsForVisibleRows
        if (items != nil && items!.count > 0) {
            let maxSection = items!.map { $0.section }.max()!
            let maxRow = items!.filter { $0.section == maxSection }.map { $0.row }.max()!
            return IndexPath(row: maxRow + 1, section: maxSection)
        }
        return IndexPath(row: 1, section: 0)
    }

}