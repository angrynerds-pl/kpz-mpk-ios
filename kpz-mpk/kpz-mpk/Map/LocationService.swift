//
//  LocationService.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 12/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import MapKit

class LocationService {
  private let locationManager = CLLocationManager()
  private(set) var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 51.111510, longitude: 17.059737)

  public init() {
    askUserForLocationPermission()
  }

  func askUserForLocationPermission() {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }
}
