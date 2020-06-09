//
//  Rate.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 06/06/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct Rate: Codable {
  let rating: RateType
  
  init(rating: RateType) {
    self.rating = rating
  }
}
