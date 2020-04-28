//
//  Route.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct Route: Codable {
  let routeId: String
  let distance: Double
  let routeGtfsType: TimetableRouteType
  let trips: Trip
}

struct Trip: Codable {
  let tripHeadsign: String
  let distance: String
}

enum TimetableRouteType: Int, Codable {
  case tram = 0
  case subway = 1
  case rail = 2
  case bus = 3
  case ferry = 4
  case cableTram = 5
  case aerialLift = 6
  case funicular = 7
  case trolleybus = 11
  case monorail = 12
}
