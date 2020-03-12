//
//  MapViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 12/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import MapKit

final class MapViewModel {
  private weak var presenter: MapViewControllerPresenter?
  let locationManager = CLLocationManager()

  init(presenter: MapViewControllerPresenter?) {
    self.presenter = presenter
  }

  func centerMap(
    atLatitude lat: Double,
    atLongitude long: Double,
    forRegionRadious radious: Double) {
    let location = CLLocation(latitude: lat, longitude: long)
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: radious,
      longitudinalMeters: radious)

    presenter?.centerMap(coordinateRegion: coordinateRegion)
  }

  func askUserForLocationPermission() {
    presenter?.askUserForLocationPermission(locationManager: locationManager)
  }
}
