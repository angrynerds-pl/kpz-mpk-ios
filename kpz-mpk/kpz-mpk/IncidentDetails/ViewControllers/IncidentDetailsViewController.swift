//
//  IncidentDetailsViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 16/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

protocol IncidentDetailsControllerPresenter: NSObject {
  func setLabels(description: String, type: String, routeId: String, headsign: String)
}

class IncidentDetailsViewController: UIViewController {
  var viewModel: IncidentDetailsViewModel!
  
  @IBOutlet private weak var incidentDescriptionLabel: UILabel!
  @IBOutlet private weak var incidentTypeLabel: UILabel!
  @IBOutlet private weak var routeIdLabel: UILabel!
  @IBOutlet private weak var tripHeadsignLabel: UILabel!
  @IBOutlet private weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    viewModel.setLabels()
  }
}

extension IncidentDetailsViewController: IncidentDetailsControllerPresenter {
  func setLabels(description: String, type: String, routeId: String, headsign: String) {
    incidentDescriptionLabel.text = description
    incidentTypeLabel.text = type
    routeIdLabel.text = routeId
    tripHeadsignLabel.text = headsign
  }
}

extension IncidentDetailsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.incident.affectedHeadsigns.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sortedHeadsigns = viewModel.getAffectedheadsignsSorted()
    guard
      let affectedHeadsignItem = sortedHeadsigns[safe: indexPath.row],
      let cell = tableView.dequeueReusableCell(withIdentifier: "affectedHeadsignCell") as? AffectedHeadsignCell else {
        return UITableViewCell()
    }
    
    cell.setCell(affectedHeadSign: affectedHeadsignItem)
    return cell
  }
}
