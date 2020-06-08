//
//  RateType.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 05/06/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

enum RateType: Int, Codable {
  case positive = 1
  case negative = -1
  
  var rateButtonDefaultImage: UIImage? {
    switch self {
    case .positive:
      return UIImage(systemName: "plus.circle")
    case .negative:
      return UIImage(systemName: "minus.circle")
    }
  }
  
  var rateButtonSelectedImage: UIImage? {
    switch self {
    case .positive:
      return UIImage(systemName: "plus.circle.fill")
    case .negative:
      return UIImage(systemName: "minus.circle.fill")
    }
  }
}
