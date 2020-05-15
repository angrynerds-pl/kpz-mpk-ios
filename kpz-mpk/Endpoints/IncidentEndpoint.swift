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
  case postIncident(incident: ReportIncident)
  
  var method: HTTPMethod {
    switch self {
    case .getIncidents:
      return .get
    case .getIncident:
      return .get
    case .postIncident:
      return .post
    }
  }
  
  var path: String {
    switch self {
    case .getIncidents:
      return "incidents"
    case .getIncident(let id):
      return "incidents/\(id)"
    case .postIncident:
      return "incidents"
    }
  }
  
  var bodyParameters: Encodable? {
    switch self {
    case .postIncident(let incident):
      return incident
    default:
      return nil
    }
  }
  
}
