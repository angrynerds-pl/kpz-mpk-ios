//
//  MapViewDelegate.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 13/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

protocol IncidentDelegate: class {
  func incidentDelegate(incidentIsReported incident: Incident)
}
