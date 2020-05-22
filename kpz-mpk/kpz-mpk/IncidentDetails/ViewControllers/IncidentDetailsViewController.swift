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
    
    let isSectionExpanded = viewModel.expandCloseTable(section: section, sectionItems: (dataSource?.affectedRoutes[section])!)
    
    switch isSectionExpanded {
    case .expanded:
      sender.setTitle("Open", for: .normal)
    case .notExpanded:
      sender.setTitle("Close", for: .normal)
    }
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
    let headerView = ExpandableSectionHeaderView(
      target: self,
      section: section,
      action: #selector(handleExpandClose),
      title: (dataSource?.affectedRoutes[section].routeId)!,
      frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.width, height: 36.0)),
      sectionViewState: (dataSource?.affectedRoutes[section].isSectionExpanded)!
    )
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 36.0
  }
}
