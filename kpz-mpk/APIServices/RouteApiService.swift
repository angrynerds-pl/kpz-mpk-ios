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
  func getNearbyRoutes(location: CLLocationCoordinate2D, success: (([Route]) -> ())?, failure: ((ApiError) -> Void)?)
}

class RouteApiService: RouteApiServiceProtocole {
    let apiService: ApiServiceProtocol = ApiService()
  
  func getNearbyRoutes(location: CLLocationCoordinate2D, success: (([Route]) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: TimetableEndpoint.getNearbyRoutes(location: location), success: success, failure: failure)
  }
}
