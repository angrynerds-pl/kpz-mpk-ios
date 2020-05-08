//
//  RoutePickViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 25/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

protocol RoutePickViewControllerPresenter: NSObject, ErrorPresenting {
  func displayRoutes(dataSource data: RouteDataSource)
}

class RoutePickViewController: UITableViewController {
  
  var viewModel: RoutePickViewModel!
  private var dataSource: RouteDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard
      let routeId = self.dataSource?.routes[indexPath.section].routeId,
      let tripHeadsign = self.dataSource?.routes[indexPath.section].trips[indexPath.item].tripHeadsign else {
        return
    }
    
    viewModel.reportIncident(routeId: routeId, tripHeadsign: tripHeadsign)
  }
}

extension RoutePickViewController: RoutePickViewControllerPresenter {
  
  func displayRoutes(dataSource: RouteDataSource) {
    self.dataSource = dataSource
    tableView.dataSource = self.dataSource
    tableView.reloadData()
  }
}
