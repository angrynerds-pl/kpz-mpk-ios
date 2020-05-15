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
  weak var incidentDelegate: IncidentDelegate?
  
  private weak var presenter: RoutePickViewControllerPresenter?
  private var reportedLocation: CLLocationCoordinate2D
  private var reportedType: IncidenType
  private let routeApiService: RouteApiServiceProtocole = RouteApiService()
  private let incidentApiService: IncidentApiService = IncidentApiService()
  
  init(
    presenter: RoutePickViewControllerPresenter?,
    reportedLocation location: CLLocationCoordinate2D,
    reportedType type: IncidenType,
    incidentDelegate delegate: IncidentDelegate?
  ) {
    self.presenter = presenter
    reportedLocation = location
    reportedType = type
    incidentDelegate = delegate
    
    getRoutes()
  }
  
  func getRoutes() {
    routeApiService.getNearbyRoutes(location: reportedLocation, success: { (routes) in
      let routesDataSource = RouteDataSource(routes: routes)
      self.presenter?.displayRoutes(dataSource: routesDataSource)
    }) { (apiError) in
      self.presenter?.present(error: apiError)
    }
  }
  
  func reportIncident(routeId: String, tripHeadsign: String) {
    let location = IncidentLocation(latitude: self.reportedLocation.latitude, longitude: self.reportedLocation.longitude)
    let incident = ReportIncident(
      description: tripHeadsign,
      type: self.reportedType,
      location: location, routeId: routeId,
      tripHeadsign: tripHeadsign
    )
    
    incidentApiService.postIncident(incidentToReport: incident, success: { (incident) in
      self.incidentDelegate?.incidentDelegate(didReport: incident)
    }) { (apiError) in
      self.presenter?.present(error: apiError)
    }
  }
}
