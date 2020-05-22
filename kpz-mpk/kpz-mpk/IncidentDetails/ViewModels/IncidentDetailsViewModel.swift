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
  
  func expandCloseTable(section: Int, sectionItems: AffectedRoutes) -> SectionViewState {
    let indicies = sectionItems.affectedHeadsigns.indices
    let isSectionExpanded = sectionItems.isSectionExpanded
    var indexPaths = [IndexPath]()
    
    for row in indicies {
      let indexPath = IndexPath(row: row, section: section)
      indexPaths.append(indexPath)
    }
    
    presenter?.expandCloseTable(section: section, indexPaths: indexPaths, isSectionExpanded: isSectionExpanded)
    
    return isSectionExpanded
  }
  
  func setLabels() {
    presenter?.setLabels(
      description: incident.description,
      type: incident.type.prettyName,
      routeId: incident.routeId,
      headsign: incident.tripHeadsign
    )
  }
  
  func setTable() {
    let incidentDetailsDataSource = IncidentDetailsDataSource(affectedHeadSigns: groupAffectedHeadsigns())
    presenter?.setTable(dataSource: incidentDetailsDataSource)
  }
  
  func groupAffectedHeadsigns() -> [String: [AffectedHeadsign]] {
    return Dictionary(grouping: incident.affectedHeadsigns.sorted(), by: {$0.routeId})
  }
}
