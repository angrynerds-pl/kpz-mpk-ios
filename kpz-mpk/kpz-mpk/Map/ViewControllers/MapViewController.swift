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

  @IBOutlet weak var centerMapButton: UIButton!
  @IBOutlet private weak var centerMapButtonView: UIView!
  @IBOutlet private weak var mapView: MKMapView!

  lazy var viewModel = MapViewModel(presenter: self)

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.centerMapOnUser()
    setUpUI()

  }
  
  @IBAction func centerMapButtonPressed(_ sender: UIButton) {
    viewModel.centerMapOnUser()
  }
}

extension MapViewController: MapViewControllerPresenter {
  func centerMap(coordinateRegion: MKCoordinateRegion) {
    mapView.setRegion(coordinateRegion, animated: true)
  }

  func setUpUI() {
    centerMapButtonView.layer.cornerRadius = 32
    centerMapButtonView.layer.shadowColor = UIColor.gray.cgColor
    centerMapButtonView.layer.shadowOpacity = 1
    centerMapButtonView.layer.shadowOffset = .zero
    centerMapButtonView.layer.shadowRadius = 10
    centerMapButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
  }
}
