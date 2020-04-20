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
  
  // MARK: - IBOutlets
  @IBOutlet private weak var cancelButton: RoundedButton!
  @IBOutlet private weak var confirmButton: RoundedButton!
  @IBOutlet private weak var reportButton: RoundedButton!
  @IBOutlet private weak var centerMapButton: UIButton!
  @IBOutlet private weak var centerMapButtonView: RoundedView!
  @IBOutlet private weak var locationPickingView: UIView!
  @IBOutlet private weak var locationPickIcon: UIImageView!
  @IBOutlet private weak var mapView: MKMapView!
  @IBOutlet private weak var pickLocationUpLabel: UILabel!
  @IBOutlet private weak var pickLocationDownLabel: UILabel!
  
  lazy var viewModel = MapViewModel(presenter: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    
    setUpUI()
    viewModel.centerMapOnUser()
    registerMapAnnotationViews()
    viewModel.displayAnnotations()
  }
  
  // MARK: - Buttons actions
  
  @IBAction private func centerMapButtonPressed(_ sender: UIButton) {
    viewModel.centerMapOnUser()
  }
  
  @IBAction private func reportButtonPressed(_ sender: UIButton) {
    reportButton.isHidden = true
    confirmButton.isHidden = false
    cancelButton.isHidden = false
    locationPickingView.isHidden = false
    print("Report")
  }
  
  @IBAction private func confirmButtonPressed(_ sender: UIButton) {
    print("Confirm")
  }
  
  @IBAction func cancelButtonPressed(_ sender: UIButton) {
    confirmButton.isHidden = true
    cancelButton.isHidden = true
    reportButton.isHidden = false
    locationPickingView.isHidden = true
    print("Cancel")
  }
  
  private func registerMapAnnotationViews() {
    mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(IncidentAnnotation.self))
  }
}

// MARK: - MapViewControllerPresenter protocole

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
    centerMapButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
    
    //Report Button
    reportButton.roundAll()
    
    //Confirm Button
    confirmButton.isHidden = true
    confirmButton.roundRight()
    
    //Cancel Button
    cancelButton.isHidden = true
    cancelButton.roundLeft()
    
    //Location Pick Icon
    locationPickingView.isHidden = true
  }
  
  func displayAnnotations(annotations: [MKAnnotation]) {
    mapView.addAnnotations(annotations)
  }
}

// MARK: - MKMapViewDelegate protocole

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
    
    annotationView.image = annotation.incident.type.image
    
    return annotationView
  }
}
