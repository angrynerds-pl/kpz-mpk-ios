//
//  MapViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 12/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import MapKit
import Auth0

final class MapViewModel {
  private weak var presenter: MapViewControllerPresenter?
  let locationService = LocationService()
  let incidentApiService: IncidentApiServiceProtocole = IncidentApiService()
  let sessionManager: SessionManager
  
  init(presenter: MapViewControllerPresenter?, sessionManager: SessionManager = SessionManager.shared) {
    self.presenter = presenter
    self.sessionManager = sessionManager
    
    locationService.delegate = self
  }
  
  func login() {
    sessionManager.auth0Login()
  }
  
  func renewAuth() {
    sessionManager.renewAuth { (error) in
      if error != nil {print(error!)}
    }
  }
  
  func shouldPerformSegue(withIdentifier identifier: String) -> Bool {
    switch identifier {
    case "userMenuSegue":
      return SessionManager.shared.credentialsManager.hasValid()
    case "segueType":
      return SessionManager.shared.credentialsManager.hasValid()
    default:
      return true
    }
  }
  
  func presentState(stateToPresent state: MapState) {
    switch state {
    case .mapBrowsing:
      presenter?.showMapBrowsingState()
    case .reportIncident:
      presenter?.showReportingState()
    }
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
