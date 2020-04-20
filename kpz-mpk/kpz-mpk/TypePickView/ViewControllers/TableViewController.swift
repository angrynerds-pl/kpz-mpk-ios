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
  var incidentTypeItems: [IncidentTypeItem] = [] //To na pewno do VM
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    incidentTypeItems = createIncidentTypeItemsArray()
  }
  
  func createIncidentTypeItemsArray() -> [IncidentTypeItem] { // To tez do VM
    var incidentTypeItems: [IncidentTypeItem] = []
    
    incidentTypeItems.append(IncidentTypeItem(incidentType: .collision))
    incidentTypeItems.append(IncidentTypeItem(incidentType: .noPassage))
    
    return incidentTypeItems
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return incidentTypeItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable force_cast
    let incidenTypeItem = incidentTypeItems[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentTypeCell") as! IncidentTypeCell
    
    cell.setCell(incidentTypeItem: incidenTypeItem)
    return cell
  }
}
