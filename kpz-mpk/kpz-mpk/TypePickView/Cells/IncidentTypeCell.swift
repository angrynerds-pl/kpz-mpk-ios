//
//  IncidentTypeCell.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class IncidentTypeCell: UITableViewCell {
  @IBOutlet private weak var incidenTypeName: UILabel!
  @IBOutlet private weak var incidenTypeImageView: UIImageView!
  
  func setCell(incidentTypeItem item: IncidentTypeItem) {
    incidenTypeName.text = item.typeName.rawValue
    incidenTypeImageView.image = item.image
  }
  
}
