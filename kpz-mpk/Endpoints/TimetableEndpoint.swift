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
  case getNearbyLines(location: CLLocationCoordinate2D)
  
  var method: HTTPMethod {
    switch self {
    case .getNearbyLines:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getNearbyLines:
      return "timetable/nearby"
    }
  }
  
  var queryItems: Parameters? {
    switch self {
    case .getNearbyLines(let location):
      return ["longitude": location.longitude,
              "latitude": location.latitude]
    }
  }
  
}
