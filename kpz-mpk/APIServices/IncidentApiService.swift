//
//  IncidentApiService.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 30/03/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

protocol IncidentApiServiceProtocole {
  func getIncidents(success: (([Incident]) -> ())?, failure: ((ApiError) -> Void)?)
  func getIncident(id: String, success: ((Incident) -> ())?, failure: ((ApiError) -> Void)?)
  func getIncidentView(id: String, success: ((IncidentView) -> ())?, failure: ((ApiError) -> Void)?)
  func postIncident(incidentToReport incident: ReportIncident, success: ((Incident) -> ())?, failure: ((ApiError) -> Void)?)
  func postRating(id: String, rate: Rate, success: ((Rating) -> ())?, failure: ((ApiError) -> Void)?)
  func deleteRating(id: String, success: ((Rating) -> ())?, failure: ((ApiError) -> Void)?)
}

class IncidentApiService: IncidentApiServiceProtocole {
  let apiService: ApiServiceProtocol = ApiService()
  
  func deleteRating(id: String, success: ((Rating) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.deleteRating(id: id), success: success, failure: failure)
  }
  
  func getIncidentView(id: String, success: ((IncidentView) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.getIncidentView(id: id), success: success, failure: failure)
  }
  
  func getIncident(id: String, success: ((Incident) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.getIncident(id: id), success: success, failure: failure)
  }
  
  func getIncidents(success: (([Incident]) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.getIncidents, success: success, failure: failure)
  }
  
  func postIncident(incidentToReport incident: ReportIncident, success: ((Incident) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.postIncident(incident: incident), success: success, failure: failure)
  }
  
  func postRating(id: String, rate: Rate, success: ((Rating) -> ())?, failure: ((ApiError) -> Void)?) {
    apiService.request(endpoint: IncidentEndpoint.postRating(id: id, rate: rate), success: success, failure: failure)
  }
}
