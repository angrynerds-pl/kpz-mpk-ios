//
//  IncidentApiService.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 30/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

protocol IncidentApiServiceProtocole {
  func getIncidents(success: (([Incident]) -> ())?)
  func getIncident(id: String, success: ((Incident) -> ())?)
}

class IncidentApiService: IncidentApiServiceProtocole {
  let apiService: ApiServiceProtocol = ApiService()
  
  func getIncidents(success: (([Incident]) -> ())?) {
    apiService.request(endpoint: IncidentEndpoint.getIncidents) { (response) in
      success?(response)
    }
  }
  
  func getIncident(id: String, success: ((Incident) -> ())?) {
    apiService.request(endpoint: IncidentEndpoint.getIncident(id: id)) { (response) in
      success?(response)
    }
  }
}
