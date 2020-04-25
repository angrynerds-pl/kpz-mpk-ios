//
//  TableViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return IncidenType.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let incidenTypeItem = IncidenType.allCases[safe: indexPath.row] else {
      return UITableViewCell()
    }
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentTypeCell") as? IncidentTypeCell else {
      return UITableViewCell()
    }
    
    cell.setCell(incidentTypeItem: incidenTypeItem)
    return cell
  }
}
