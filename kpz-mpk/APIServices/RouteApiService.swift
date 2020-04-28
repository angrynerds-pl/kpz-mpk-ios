//
//  RouteApiService.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import CoreLocation

protocol RouteApiServiceProtocole {
  func getNearbyRoutes(location: CLLocationCoordinate2D, success: (([Route]) -> ())?)
}

class RouteApiService: RouteApiServiceProtocole {
  let apiService: ApiServiceProtocol = ApiService()
  
  func getNearbyRoutes(location: CLLocationCoordinate2D, success: (([Route]) -> ())?) {
    apiService.request(endpoint: TimetableEndpoint.getNearbyLines(location: location)) { (response) in
      success?(response)
    }
  }
}
