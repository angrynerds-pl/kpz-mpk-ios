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
  let affectedHeadsigns: [AffectedHeadsign]
  var isSectionExpanded: SectionViewState
  
  init(routeId: String, affectedHeadsigns: [AffectedHeadsign]) {
    self.isSectionExpanded = .notExpanded
    self.routeId = routeId
    self.affectedHeadsigns = affectedHeadsigns
  }
}
