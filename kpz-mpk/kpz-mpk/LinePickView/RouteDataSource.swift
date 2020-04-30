//
//  RouteDataSource.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 29/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RouteDataSource: NSObject {
  private var routes: [Route]
  
  init(routes: [Route]) {
    self.routes = routes
  }
}
extension RouteDataSource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return routes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let routeItem = routes[safe: indexPath.row] else {
      return UITableViewCell()
    }
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell") as? RouteCell else {
      return UITableViewCell()
    }
    
    cell.setCell(routeItem: routeItem)
    return cell
  }
}
