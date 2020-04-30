//
//  TimetableEndpoint.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

enum TimetableEndpoint: ApiEndpoint {
  case getNearbyRoutes(location: CLLocationCoordinate2D)
  
  var method: HTTPMethod {
    switch self {
    case .getNearbyRoutes:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getNearbyRoutes:
      return "timetable/nearby"
    }
  }
  
  var queryItems: Parameters? {
    switch self {
    case .getNearbyRoutes(let location):
      return ["longitude": location.longitude,
              "latitude": location.latitude]
    }
  }
  
}
