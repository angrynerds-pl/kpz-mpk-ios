//
//  LinePickViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 25/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class LinePickViewController: UITableViewController {
  
  var viewModel: LinePickViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
      
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var policzone = viewModel.routesAPI.count
    return policzone
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let routeItem = viewModel.routesAPI[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell") as? RouteCell
    
    cell?.setCell(routeItem: routeItem)
    return cell!
    
  }
  
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    guard let routeItem = viewModel.routesAPI[safe: indexPath.row] else {
//      return UITableViewCell()
//    }
//
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell") as? RouteCell else {
//      return UITableViewCell()
//    }
//
//    cell.setCell(routeItem: routeItem)
//    return cell
//  }
  
}
