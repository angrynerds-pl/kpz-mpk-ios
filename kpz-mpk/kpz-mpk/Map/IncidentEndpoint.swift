//
//  IncidentEndpoint.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 11/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import Alamofire

enum IncidentEndpoint: ApiEndpoint {
  case getIncidents
  case getIncident(id: String)
  
  var method: HTTPMethod {
    switch self {
    case .getIncidents:
      return .get
    case .getIncident:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getIncidents:
      return "incidents"
    case .getIncident(let id):
      return "incidents/\(id)"
    }
  }
  
}
