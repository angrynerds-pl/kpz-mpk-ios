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
}

extension RoutePickViewController: RoutePickViewControllerPresenter {
  func present(error: ApiError) {
    showApiError(error: error)
  }
  
  func displayRoutes(dataSource: RouteDataSource) {
    self.dataSource = dataSource
    tableView.dataSource = self.dataSource
    tableView.reloadData()
  }
}
