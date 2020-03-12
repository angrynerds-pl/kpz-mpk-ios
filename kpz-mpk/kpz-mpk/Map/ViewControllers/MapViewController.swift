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
}

class MapViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!

  lazy var viewModel = MapViewModel(presenter: self)

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.centerMap(atLatitude: 51.111510, atLongitude: 17.059737, forRegionRadious: 1000)
  }

}

extension MapViewController: MapViewControllerPresenter {
  func centerMap(coordinateRegion: MKCoordinateRegion) {
    mapView.setRegion(coordinateRegion, animated: true)
  }
}
