//
//  LinePickViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation

final class LinePickViewModel {
  var reportedLocation: CLLocationCoordinate2D
  var reportedType: IncidenType
  let routeApiService: RouteApiServiceProtocole = RouteApiService()
  
  var routesAPI: [Route] = [Route(routeId: "test", distance: 12.2, trips: [], routeGtfsType: TimetableRouteType(rawValue: 3)!)]
  
  init(
    reportedLocation location: CLLocationCoordinate2D,
    reportedType type: IncidenType
  ) {
    reportedLocation = location
    reportedType = type
  }
}
