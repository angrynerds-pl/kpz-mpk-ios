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
  let locationService = LocationService()
  let incidentApiService: IncidentApiServiceProtocole = IncidentApiService()
  
  init(presenter: MapViewControllerPresenter?) {
    self.presenter = presenter
    
    locationService.delegate = self
  }
  
  func displayAnnotations() {
    incidentApiService.getIncidents { (incidents) in
      let annotations = incidents.map { IncidentAnnotation(forIncident: $0)}
      self.presenter?.displayAnnotations(annotations: annotations)
    }
  }
  
  func centerMapOnUser() {
    let regionRadius: Double = 1000
    let coordinateRegion = MKCoordinateRegion(
      center: locationService.userLocation ??
        CLLocationCoordinate2D(
          latitude: 51.06280,
          longitude: 17.02193),
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    
    presenter?.centerMap(coordinateRegion: coordinateRegion)
  }
  
  func displayCenterLocation(for centerLocation: CLLocationCoordinate2D) {
    // Later we will display location address
    let lat: String = String(format: "%.4f", centerLocation.latitude)
    let long: String = String(format: "%.4f", centerLocation.longitude)
    
    presenter?.displayCenterLocation(latitudeText: lat, longitude: long)
  }
}

extension MapViewModel: LocationServiceDelegate {
  func locationService(didUpdateInitialLocation location: CLLocation) {
    centerMapOnUser()
  }
  
  func locationService(didUpdateLocation location: CLLocation) {
  }
  
  func locationService(didChangeAuthorization isAuthorized: Bool) {
  }
}
