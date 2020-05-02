//
//  TimetableRouteType.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

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

// Add tram, other, bus images
