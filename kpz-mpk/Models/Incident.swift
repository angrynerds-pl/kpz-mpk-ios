//
//  Incident.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 11/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct Incident: Codable {
  let id: String
  let description: String
  let type: IncidenType
  let location: IncidentLocation
  let routeId: String
  let tripHeadsign: String
  var affectedHeadsigns: [AffectedHeadsign]
}
