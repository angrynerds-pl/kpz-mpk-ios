//
//  IncidentView.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 01/06/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct IncidentView: Codable {
  let id: String
  let description: String
  let type: IncidenType
  let location: IncidentLocation
  let routeId: String
  let tripHeadsign: String
  let routeGtfsType: TimetableRouteType
  let affectedHeadsigns: [AffectedHeadsign]
}
