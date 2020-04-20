//
//  IncidentTypeItem.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class IncidentTypeItem {
  let typeName: IncidenType
  let image: UIImage?
  
  init(incidentType type: IncidenType) {
    self.typeName = type
    self.image = type.image
  }
}
