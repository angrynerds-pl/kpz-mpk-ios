//
//  RouteDataSource.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 29/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RouteDataSource: NSObject {
  private(set) var routes: [Route]
  
  init(routes: [Route]) {
    self.routes = routes
  }
}

extension RouteDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return routes.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return routes[section].routeId
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return routes[section].trips.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let routeItem = routes[indexPath.section].trips[safe: indexPath.row],
      let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell") as? RouteCell else {
      return UITableViewCell()
    }
    
    cell.setCell(routeItem: routeItem)
    return cell
  }
}
