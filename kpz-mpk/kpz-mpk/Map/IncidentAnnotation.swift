//
//  IncidentAnnotation.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 15/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import MapKit

class IncidentAnnotation: NSObject, MKAnnotation {
  var incident: Incident
  var title: String?
  var subtitle: String?
  
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: incident.location.latitude,
      longitude: incident.location.longitude
    )
  }
  
  init(forIncident incident: Incident) {
    self.incident = incident
    self.title = incident.type.prettyName
    self.subtitle = ("\(incident.routeId) \(incident.tripHeadsign)")
  }
}
