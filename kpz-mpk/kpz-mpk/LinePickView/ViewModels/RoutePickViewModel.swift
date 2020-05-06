//
//  RoutePickViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation

final class RoutePickViewModel {
  private var reportedLocation: CLLocationCoordinate2D
  private var reportedType: IncidenType
  private weak var presenter: RoutePickViewController?
  
  let routeApiService: RouteApiServiceProtocole = RouteApiService()

  init(
    presenter: RoutePickViewController?,
    reportedLocation location: CLLocationCoordinate2D,
    reportedType type: IncidenType
  ) {
    self.presenter = presenter
    reportedLocation = location
    reportedType = type
    
    getRoutes()
  }
  
  func getRoutes() {
    routeApiService.getNearbyRoutes(location: reportedLocation, success: { (routes) in
      let routesDataSource = RouteDataSource(routes: routes)
      self.presenter?.displayRoutes(dataSource: routesDataSource)
    }) { (apiError) in
      print(apiError)
    }
  }
}
