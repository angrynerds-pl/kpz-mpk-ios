//
//  AffectedRoutes.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 21/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

enum ViewState {
  case expanded
  case notExpanded
}

class AffectedRoutes {
  let routeId: String
  let affectedHeadsigns: [AffectedHeadsign]
  var viewState: ViewState
  
  init(routeId: String, affectedHeadsigns: [AffectedHeadsign]) {
    self.viewState = .notExpanded
    self.routeId = routeId
    self.affectedHeadsigns = affectedHeadsigns
  }
}
