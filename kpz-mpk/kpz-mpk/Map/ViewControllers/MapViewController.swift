//
//  MapViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 02/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewControllerPresenter: NSObject {
  func centerMap(coordinateRegion: MKCoordinateRegion)
  func askUserForLocationPermission(locationManager: CLLocationManager)
}

class MapViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!

  lazy var viewModel = MapViewModel(presenter: self)

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.centerMapOnUser()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.askUserForLocationPermission()
  }

}

extension MapViewController: MapViewControllerPresenter {
  func centerMap(coordinateRegion: MKCoordinateRegion) {
    mapView.setRegion(coordinateRegion, animated: true)
  }

  func askUserForLocationPermission(locationManager: CLLocationManager) {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      mapView.showsUserLocation = true
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }
}
