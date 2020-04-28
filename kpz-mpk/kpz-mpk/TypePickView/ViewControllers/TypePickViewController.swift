//
//  TypePickViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class TypePickViewController: UITableViewController {
  
  var viewModel: TypePickViewModel!
  
  override func viewDidLoad() {
    tableView.delegate = self
    super.viewDidLoad()
    
    print("Center: ")
    print(viewModel.reportedLocation)
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "segueLine", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueLine" {
      let nextSceene = segue.destination as? LinePickViewController
      let indexPath = self.tableView.indexPathForSelectedRow
      
      // Pozbyc sie tego force unwrapa
      let selectedRow = IncidenType.allCases[safe: indexPath!.row]
      
      nextSceene?.reportedIncidentType = selectedRow
    }
  }
}
