//
//  TableViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

// To chyba chcemy sobie zamienic na ogolny kontroller a pozniej uzywac odpowiedniego delegate
// Musimy ogarnac VM
class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return IncidenType.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable force_cast
    let incidenTypeItem = IncidenType.allCases[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentTypeCell") as! IncidentTypeCell
    
    cell.setCell(incidentTypeItem: incidenTypeItem)
    return cell
  }
}
