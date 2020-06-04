//
//  AffectedRoutes.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 21/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

class AffectedRoutes {
  let routeId: String
  let headsign: [String]
  var isSectionExpanded: SectionViewState
  
  init(affectedHeadsign: AffectedHeadsign) {
    self.isSectionExpanded = .notExpanded
    self.routeId = affectedHeadsign.routeId
    self.headsign = affectedHeadsign.headsigns
  }
}
