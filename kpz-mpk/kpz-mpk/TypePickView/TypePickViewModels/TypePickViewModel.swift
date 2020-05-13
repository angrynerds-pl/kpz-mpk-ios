//
//  TypePickViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 28/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit
import CoreLocation

final class TypePickViewModel {
  weak var mapViewDelegate: MapViewDelegate?
  
  private(set) var reportedLocation: CLLocationCoordinate2D
  
  init(reportedLocation location: CLLocationCoordinate2D,
       mapViewDelegate delegate: MapViewDelegate?
  ) {
    reportedLocation = location
    self.mapViewDelegate = delegate
  }
}
