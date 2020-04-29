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
  let trips: [Trip]
  let routeGtfsType: TimetableRouteType
}
