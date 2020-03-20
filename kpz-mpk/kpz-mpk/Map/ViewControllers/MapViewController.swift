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
  func setUpUI()
}

class MapViewController: UIViewController {

  @IBOutlet private weak var locationPickIcon: UIImageView!
  @IBOutlet private weak var centerMapButton: UIButton!
  @IBOutlet private weak var centerMapButtonView: UIView!
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction private func centerMapButtonPressed(_ sender: UIButton) {
    viewModel.centerMapOnUser()
  }

  lazy var viewModel = MapViewModel(presenter: self)

  override func viewDidLoad() {
    super.viewDidLoad()

    mapView.delegate = self
    viewModel.centerMapOnUser()
    setUpUI()
  }
}

extension MapViewController: MapViewControllerPresenter {
  func centerMap(coordinateRegion: MKCoordinateRegion) {
    mapView.setRegion(coordinateRegion, animated: true)
  }

  func setUpUI() {
    //Center Map Button
    centerMapButtonView.layer.cornerRadius = centerMapButtonView.bounds.width / 2
    centerMapButtonView.layer.shadowColor = UIColor.gray.cgColor
    centerMapButtonView.layer.shadowOpacity = 1
    centerMapButtonView.layer.shadowOffset = .zero
    centerMapButtonView.layer.shadowRadius = 10
    centerMapButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
    
    //Location Pick Icon
    locationPickIcon.isHidden = true //We will toogle it when user would like to report incident
  }
}

extension MapViewController: MKMapViewDelegate {
  func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    print("Center lat -> \(mapView.centerCoordinate.latitude)")
    print("Center long -> \(mapView.centerCoordinate.longitude)")
  }
}
