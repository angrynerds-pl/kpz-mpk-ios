//
//  AffectedHeadsignCell.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 18/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class AffectedHeadsignCell: UITableViewCell {
  
  @IBOutlet private weak var headsignLabel: UILabel!
  
  func setCell(headSign: String) {
    headsignLabel.text = headSign
  }
}
