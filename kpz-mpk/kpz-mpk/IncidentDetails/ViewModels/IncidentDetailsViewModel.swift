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
  private let incidentApiService: IncidentApiService = IncidentApiService()
  private let sessionManager: SessionManager
  
  init(
    presenter: IncidentDetailsControllerPresenter?,
    incident: Incident,
    incidentDelegate delegate: IncidentDelegate?,
    sessionManager: SessionManager = SessionManager.shared
  ) {
    self.presenter = presenter
    self.incidentDelegate = delegate
    self.incident = incident
    self.sessionManager = sessionManager
    self.getIncidentView()
  }
  
  func expandCloseTable(section: Int, sectionItems: AffectedRoutes) -> SectionViewState {
    let indicies = sectionItems.headsign.indices
    let isSectionExpanded = sectionItems.isSectionExpanded
    let indexPaths = indicies.map { IndexPath(row: $0, section: section) }
    
    presenter?.expandCloseTable(section: section, indexPaths: indexPaths, isSectionExpanded: isSectionExpanded)
    
    return isSectionExpanded
  }
  
  func getIncidentView() {
    incidentApiService.getIncidentView(id: incident.id, success: { (incidentView) in
      let incidentDetailsDataSource = IncidentDetailsDataSource(incidentView: incidentView)
      self.presenter?.setTable(dataSource: incidentDetailsDataSource)
      self.setRating(incidentView: incidentView)
    }) { (apiError) in
      self.presenter?.present(error: apiError)
    }
  }
  
  func setLabels() {
    presenter?.setLabels(
      description: incident.description,
      type: incident.type.prettyName,
      routeId: incident.routeId,
      headsign: incident.tripHeadsign
    )
  }
  
  func setRating(incidentView: IncidentView) {
    presenter?.setRating(
      rating: incidentView.rating,
      myRating: incidentView.myRating,
      isLoggIn: sessionManager.credentialsManager.hasValid()
    )
  }
  
  func postRating(rate: RateType) {
    let rate = Rate(rating: rate)

    incidentApiService.postRating(id: incident.id, rate: rate, success: { (rating) in
      print("Success rating")
    }) { (apiError) in
      self.presenter?.present(error: apiError)
    }
  }
  
}
