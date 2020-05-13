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
    
  private enum Constants {
    static let regionRadius = 1000.0
    static let centerOptionalCoordiate = CLLocationCoordinate2D(latitude: 51.06280, longitude: 17.02193)
    static let coordinateFormatType = "%.4f"
    static let userMenuSegueString = "userMenuSegue"
    static let segueTypeString = "segueType"
  }
  private weak var presenter: MapViewControllerPresenter?
  private let locationService = LocationService()
  private let incidentApiService: IncidentApiServiceProtocole = IncidentApiService()
  private let sessionManager: SessionManager
  
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
      if let error = error {print(error)}
    }
  }
  
  func shouldPerformSegue(withIdentifier identifier: String) -> Bool {
    switch identifier {
    case Constants.userMenuSegueString:
      return SessionManager.shared.credentialsManager.hasValid()
    case Constants.segueTypeString:
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
    incidentApiService.getIncidents(success: { (incidents) in
      let annotations = incidents.map { IncidentAnnotation(forIncident: $0)}
      self.presenter?.displayAnnotations(annotations: annotations)
    }) { (apiError) in
      self.presenter?.present(error: apiError)
    }
  }
  
  func centerMapOnUser() {
    let coordinateRegion = MKCoordinateRegion(
      center: locationService.userLocation ??
        Constants.centerOptionalCoordiate,
      latitudinalMeters: Constants.regionRadius,
      longitudinalMeters: Constants.regionRadius)
    presenter?.centerMap(coordinateRegion: coordinateRegion)
  }
  
  func displayCenterLocation(for centerLocation: CLLocationCoordinate2D) {
    // Later we will display location address
    let lat: String = String(format: Constants.coordinateFormatType, centerLocation.latitude)
    let long: String = String(format: Constants.coordinateFormatType, centerLocation.longitude)
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
