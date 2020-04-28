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
  var reportedLocation: CLLocationCoordinate2D
  
  init(reportedLocation location: CLLocationCoordinate2D) {
    reportedLocation = location
  }
}
