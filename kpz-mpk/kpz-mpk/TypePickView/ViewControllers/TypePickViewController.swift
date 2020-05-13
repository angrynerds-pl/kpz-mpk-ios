//
//  TypePickViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class TypePickViewController: UITableViewController {
  
  private enum Constants {
    static let segueLineIdentifier = "segueLine"
  }
  var viewModel: TypePickViewModel!
  
  override func viewDidLoad() {
    tableView.delegate = self
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return IncidenType.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: IncidentTypeCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    if let incidenTypeItem = IncidenType.allCases[safe: indexPath.row] {
        cell.setCell(incidentTypeItem: incidenTypeItem)
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: Constants.segueLineIdentifier, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.segueLineIdentifier {
      let nextSceene = segue.destination as? RoutePickViewController
      let indexPath = self.tableView.indexPathForSelectedRow
      
      guard let selectedRow = IncidenType.allCases[safe: indexPath!.row] else {
        return
      }
      
      nextSceene?.viewModel = RoutePickViewModel(
        presenter: nextSceene,
        reportedLocation: viewModel.reportedLocation,
        reportedType: selectedRow
      )
    }
  }
}
