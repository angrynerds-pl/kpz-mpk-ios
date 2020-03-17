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
  var locationService = LocationService()

  init(presenter: MapViewControllerPresenter?) {
    self.presenter = presenter
    locationService.delegate = self
  }

  func centerMapOnUser() {
    let regionRadius: Double = 1000
    let coordinateRegion = MKCoordinateRegion(
      center: locationService.userLocation,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)

    presenter?.centerMap(coordinateRegion: coordinateRegion)
  }
}

extension MapViewModel: LocationServiceDelegate {
  func locationService(didUpdateInitialLocation location: CLLocation) {
    print("Location Init")
  }

  func locationService(didUpdateLocation location: CLLocation) {
    print("Location Update")
  }

  func locationService(didChangeAuthorization isAuthorized: Bool) {
    print(isAuthorized)
  }
}
