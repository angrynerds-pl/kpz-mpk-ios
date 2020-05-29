//
//  IncidentDetailsDataSource.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class IncidentDetailsDataSource: NSObject {
  private(set) var affectedRoutes: [AffectedRoutes]
  
  init(affectedHeadSigns: [String: [AffectedHeadsign]]) {
    affectedRoutes = affectedHeadSigns.map {
      AffectedRoutes(routeId: $0, affectedHeadsigns: $1)
    }
  }
}
extension IncidentDetailsDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return affectedRoutes.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return affectedRoutes[section].routeId
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if affectedRoutes[section].isSectionExpanded == .notExpanded {
      return 0
    }
    return affectedRoutes[section].affectedHeadsigns.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let affectedHeadsignItem = affectedRoutes[indexPath.section].affectedHeadsigns[safe: indexPath.row],
      let cell = tableView.dequeueReusableCell(withIdentifier: "affectedHeadsignCell") as? AffectedHeadsignCell else {
        return UITableViewCell()
    }
    
    cell.setCell(affectedHeadSign: affectedHeadsignItem)
    return cell
  }
}
