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
  func displayCenterLocation(latitudeText: String, longitude: String)
  func setUpUI()
  func displayAnnotations(annotations: [MKAnnotation])
}

class MapViewController: UIViewController {
  
  @IBOutlet private weak var reportButton: UIButton!
  @IBOutlet private weak var locationPickIcon: UIImageView!
  @IBOutlet private weak var centerMapButton: UIButton!
  @IBOutlet private weak var centerMapButtonView: UIView!
  @IBOutlet private weak var mapView: MKMapView!
  @IBOutlet private weak var pickLocationUpLabel: UILabel!
  @IBOutlet private weak var pickLocationDownLabel: UILabel!
  @IBOutlet private weak var locationPickingView: UIView!
  
  @IBAction private func centerMapButtonPressed(_ sender: UIButton) {
    viewModel.centerMapOnUser()
  }
  
  lazy var viewModel = MapViewModel(presenter: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerMapAnnotationViews()
    mapView.delegate = self
    viewModel.centerMapOnUser()
    setUpUI()
    viewModel.displayAnnotations()
  }
  
  private func registerMapAnnotationViews() {
    mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(IncidentAnnotation.self))
  }
}

extension MapViewController: MapViewControllerPresenter {
  func centerMap(coordinateRegion: MKCoordinateRegion) {
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  func displayCenterLocation(latitudeText: String, longitude: String) {
    pickLocationUpLabel.text = "Center lat -> \(latitudeText)"
    pickLocationDownLabel.text = "Center long -> \(longitude)"
  }
  
  func setUpUI() {
    //Center Map Button
    centerMapButtonView.layer.cornerRadius = centerMapButtonView.bounds.width / 2
    centerMapButtonView.layer.shadowColor = UIColor.gray.cgColor
    centerMapButtonView.layer.shadowOpacity = 1
    centerMapButtonView.layer.shadowOffset = .zero
    centerMapButtonView.layer.shadowRadius = 10
    centerMapButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
    
    //Report Button
    reportButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    reportButton.layer.cornerRadius = reportButton.bounds.height / 2
    reportButton.layer.shadowColor = UIColor.gray.cgColor
    reportButton.layer.shadowOpacity = 1
    reportButton.layer.shadowOffset = .zero
    reportButton.layer.shadowRadius = 10
    
    //Cancel Button
    
    //Location Pick Icon
    locationPickingView.isHidden = true //We will toogle it when user would like to report incident
  }
  
  func displayAnnotations(annotations: [MKAnnotation]) {
    mapView.addAnnotations(annotations)
  }
}

extension MapViewController: MKMapViewDelegate {
  func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    viewModel.displayCenterLocation(for: mapView.centerCoordinate)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard !annotation.isKind(of: MKUserLocation.self) else {
      return nil
    }
    
    var annotationView: MKAnnotationView?
    
    if let annotation = annotation as? IncidentAnnotation {
      annotationView = setupIncidentAnnotationView(for: annotation, on: mapView)
    }
    
    return annotationView
  }
  
  private func setupIncidentAnnotationView(for annotation: IncidentAnnotation, on mapView: MKMapView) -> MKAnnotationView {
    let reuseIdentifier = NSStringFromClass(IncidentAnnotation.self)
    let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier, for: annotation)
    
    annotationView.image = UIImage(named: "otherIncident")
    
    switch annotation.incident.type {
    case .collision:
      annotationView.image = UIImage(named: "collision")
    case .derailment:
      annotationView.image = UIImage(named: "derailment")
    case .noElectricity:
      annotationView.image = UIImage(named: "noElectricity")
    case .noPassage:
      annotationView.image = UIImage(named: "otherIncident")
    case .trackDamage:
      annotationView.image = UIImage(named: "trackDamage")
    case .other:
      annotationView.image = UIImage(named: "otherIncident")
    }
    
    return annotationView
  }
}
