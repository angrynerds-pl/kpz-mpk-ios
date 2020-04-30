//
//  RouteCell.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 29/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {
  @IBOutlet private weak var routeIdLabel: UILabel!
  
  func setCell(routeItem item: Trip) {
    routeIdLabel.text = item.tripHeadsign
  }
  
}
