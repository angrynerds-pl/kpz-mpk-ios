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
  func setTable(dataSource data: IncidentDetailsDataSource)
  func expandCloseTable(section: Int, indexPaths: [IndexPath], isSectionExpanded: SectionViewState)
}

class IncidentDetailsViewController: UIViewController {
  var viewModel: IncidentDetailsViewModel!
  private var dataSource: IncidentDetailsDataSource?
  
  @IBOutlet private weak var incidentDescriptionLabel: UILabel!
  @IBOutlet private weak var incidentTypeLabel: UILabel!
  @IBOutlet private weak var routeIdLabel: UILabel!
  @IBOutlet private weak var tripHeadsignLabel: UILabel!
  @IBOutlet private weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    
    viewModel.setLabels()
    viewModel.setTable()
  }
  
  @objc func handleExpandClose(_ sender: UIButton) {
    let section = sender.tag
    
    viewModel.expandCloseTable(section: section, sectionItems: (dataSource?.affectedRoutes[section])!)
  }
}

extension IncidentDetailsViewController: IncidentDetailsControllerPresenter {
  func expandCloseTable(section: Int, indexPaths: [IndexPath], isSectionExpanded: SectionViewState) {
    switch isSectionExpanded {
    case .expanded:
      dataSource!.affectedRoutes[section].isSectionExpanded = .notExpanded
      tableView.deleteRows(at: indexPaths, with: .fade)
    case .notExpanded:
      dataSource!.affectedRoutes[section].isSectionExpanded = .expanded
      tableView.insertRows(at: indexPaths, with: .fade)
    }
  }
  
  func setTable(dataSource data: IncidentDetailsDataSource) {
    self.dataSource = data
    tableView.dataSource = self.dataSource
    tableView.reloadData()
  }
  
  func setLabels(description: String, type: String, routeId: String, headsign: String) {
    incidentDescriptionLabel.text = description
    incidentTypeLabel.text = type
    routeIdLabel.text = routeId
    tripHeadsignLabel.text = headsign
  }
}

extension IncidentDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let button = UIButton(type: .system)
    button.setTitle("Close", for: .normal)
    button.tag = section
    button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
    
    return button
  }
}
