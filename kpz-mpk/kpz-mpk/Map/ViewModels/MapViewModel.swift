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
  //hardcoded for now
  private var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 51.111510, longitude: 17.059737)

  init(presenter: MapViewControllerPresenter?) {
    self.presenter = presenter
  }

  func centerMapOnUser() {
    let regionRadius: Double = 1000
    let coordinateRegion = MKCoordinateRegion(
      center: userLocation,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)

    presenter?.centerMap(coordinateRegion: coordinateRegion)
  }

  func askUserForLocationPermission() {
    presenter?.askUserForLocationPermission(locationManager: locationManager)
  }
}
