/**
 *  Copyright (C) 2010-2024 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

import UIKit

protocol ChartProjectCellProtocol: AnyObject {
    func selectedCell(dataSource datasource: ChartProjectStoreDataSource, didSelectCellWith cell: ChartProjectCell)
}

class ChartProjectCell: UITableViewCell {

    weak var delegete: ChartProjectCellProtocol?
    var project: StoreProject?

    @IBOutlet private weak var chartProjectImage: UIImageView!
    @IBOutlet private weak var chartProjectTitle: UILabel!

    var chartImage: UIImage? {
        didSet {
            self.updateTable()
        }
    }

    var chartTitle: String? {
        didSet {
            self.updateTable()
        }
    }

    func updateTable() {
        chartProjectImage?.image = chartImage

        chartProjectTitle?.text = chartTitle
        chartProjectTitle.textColor = UIColor.globalTint

        if let accessoryImage = UIImage(named: "chevron.right#accessory") {
            self.accessoryView = UIImageView(image: accessoryImage)
        }
        self.accessoryView?.contentMode = .scaleAspectFit
        self.accessoryView?.tintAdjustmentMode = .normal
        self.accessoryView?.tintColor = UIColor.utilityTint
    }
}
