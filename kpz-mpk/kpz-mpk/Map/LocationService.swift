//
//  LocationService.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 12/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import MapKit

protocol LocationServiceDelegate: class {
    func locationService(didUpdateInitialLocation location: CLLocation)
    func locationService(didUpdateLocation location: CLLocation)
    func locationService(didChangeAuthorization isAuthorized: Bool)
}

class LocationService: NSObject {
    // MARK: - Public Properties
    weak var delegate: LocationServiceDelegate?

    // MARK: - Private Properties
    private let locationManager = CLLocationManager()
    private(set) var userLocation: CLLocationCoordinate2D?
    private var didUpdateInitialLocation = false

    // MARK: - Initializers
    public override init() {
        super.init()

        locationManager.delegate = self
      locationManager.startUpdatingLocation()
        askUserForLocationPermission()
    }

    // MARK: - Private Methods
    private func askUserForLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            return
        default:
          locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
      userLocation = location.coordinate
        delegate?.locationService(didUpdateLocation: location)

        if !didUpdateInitialLocation {
            didUpdateInitialLocation = true
            delegate?.locationService(didUpdateInitialLocation: location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            delegate?.locationService(didChangeAuthorization: true)
        case .denied:
            delegate?.locationService(didChangeAuthorization: false)
        default:
          return
        }
    }
}
