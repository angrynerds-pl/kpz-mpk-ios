//
//  IncidentDetailsDataSource.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class IncidentDetailsDataSource: NSObject {
  private(set) var affectedHeadSigns: [String: [AffectedHeadsign]]
  private var routeIds: [String]
  
  init(affectedHeadSigns: [String: [AffectedHeadsign]]) {
    self.affectedHeadSigns = affectedHeadSigns
    self.routeIds = Array(affectedHeadSigns.keys)
  }
}
extension IncidentDetailsDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return routeIds.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return routeIds[section]
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let routeId = routeIds[section]
    guard
      let affectedHeadSigns = affectedHeadSigns[routeId] else {
        return 0
    }
    return affectedHeadSigns.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let routeId = routeIds[indexPath.section]
    
    guard
      let affectedHeadsignItem = affectedHeadSigns[routeId]?[indexPath.row],
      let cell = tableView.dequeueReusableCell(withIdentifier: "affectedHeadsignCell") as? AffectedHeadsignCell else {
        return UITableViewCell()
    }
    
    cell.setCell(affectedHeadSign: affectedHeadsignItem)
    return cell
  }
}
