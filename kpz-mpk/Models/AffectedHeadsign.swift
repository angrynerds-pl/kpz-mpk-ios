//
//  AffectedHeadsign.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 15/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct AffectedHeadsign: Codable {
  let routeId: String
  let routeGtfsType: TimetableRouteType
  let headsigns: [String]
}

extension AffectedHeadsign: Comparable {
  static func < (lhs: AffectedHeadsign, rhs: AffectedHeadsign) -> Bool {
    return (lhs.routeId < rhs.routeId)
  }
}
