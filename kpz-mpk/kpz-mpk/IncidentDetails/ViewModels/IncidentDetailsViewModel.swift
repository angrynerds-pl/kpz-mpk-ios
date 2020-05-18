//
//  IncidentDetailsViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 16/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation

final class IncidentDetailsViewModel {
  weak var incidentDelegate: IncidentDelegate?
  
  private weak var presenter: IncidentDetailsControllerPresenter?
  private(set) var incident: Incident
  
  init(
    presenter: IncidentDetailsControllerPresenter?,
    incident: Incident,
    incidentDelegate delegate: IncidentDelegate?
  ) {
    self.presenter = presenter
    self.incidentDelegate = delegate
    self.incident = incident
  }
  
  func setLabels() {
    presenter?.setLabels(
      description: incident.description,
      type: incident.type.prettyName,
      routeId: incident.routeId,
      headsign: incident.tripHeadsign
    )
  }
  
  func getAffectedheadsignsSorted() -> [AffectedHeadsign] {
    return(incident.affectedHeadsigns.sorted(by: {
      $0.routeId < $1.routeId
    }))
  }
}
