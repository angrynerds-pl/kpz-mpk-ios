//
//  IncidentDetailsViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 16/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

protocol IncidentDetailsControllerPresenter: NSObject, ErrorPresenting {
  func setLabels(description: String, type: String, routeId: String, headsign: String)
  func setTable(dataSource data: IncidentDetailsDataSource)
  func expandCloseTable(section: Int, indexPaths: [IndexPath], isSectionExpanded: SectionViewState)
  func setRating(rating: Rating, myRating: RateType?, isLoggIn: Bool)
}

class IncidentDetailsViewController: UIViewController {
  
  var viewModel: IncidentDetailsViewModel!
  private var dataSource: IncidentDetailsDataSource?
  
  @IBOutlet private weak var incidentDescriptionLabel: UILabel!
  @IBOutlet private weak var incidentTypeLabel: UILabel!
  @IBOutlet private weak var routeIdLabel: UILabel!
  @IBOutlet private weak var tripHeadsignLabel: UILabel!
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet weak var plusRateView: RateView!
  @IBOutlet weak var minusRateView: RateView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    plusRateView.delegate = self
    minusRateView.delegate = self
    
    plusRateView.setRateButtonType(buttonType: .positive)
    minusRateView.setRateButtonType(buttonType: .negative)
    
    viewModel.setLabels()
  }
  
  @objc func handleExpandClose(_ sender: UIButton) {
    let section = sender.tag
    guard let sectionItem = dataSource?.affectedRoutes[safe: section] else { return }
    let willBeSectionView = viewModel.expandCloseTable(section: section, sectionItems: sectionItem)
    
    sender.setTitle(willBeSectionView.futureButtonTitle, for: .normal)
    if let headerView = sender.superview {
      headerView.backgroundColor = willBeSectionView.futureBackgroundColor
    }
  }
}

extension IncidentDetailsViewController: IncidentDetailsControllerPresenter {
  func setRating(rating: Rating, myRating: RateType?, isLoggIn: Bool) {
    plusRateView.setRateLabelText(text: rating.positiveCount)
    minusRateView.setRateLabelText(text: rating.negativeCount)
    
    switch myRating {
    case .positive:
      plusRateView.setRateButton(buttonState: .selected)
      minusRateView.setRateButton(buttonState: .enabled)
    case .negative:
      minusRateView.setRateButton(buttonState: .selected)
      plusRateView.setRateButton(buttonState: .enabled)
    case .none:
      if isLoggIn {
        plusRateView.setRateButton(buttonState: .enabled)
        minusRateView.setRateButton(buttonState: .enabled)
      }
    }
  }
  
  func expandCloseTable(section: Int, indexPaths: [IndexPath], isSectionExpanded: SectionViewState) {
    guard let sectionItem = dataSource?.affectedRoutes[safe: section] else { return }
    
    switch isSectionExpanded {
    case .expanded:
      sectionItem.isSectionExpanded = .notExpanded
      tableView.deleteRows(at: indexPaths, with: .fade)
    case .notExpanded:
      sectionItem.isSectionExpanded = .expanded
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

extension IncidentDetailsViewController: RateViewDelegate {
  func rateViewButtonClicked(rateButtonType: RateType?) {
    if let rateType = rateButtonType {
      viewModel.postRating(rateType: rateType)
    }
  }
}

extension IncidentDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let sectionItem = dataSource?.affectedRoutes[safe: section] else { return UIView()}
    let headerView = ExpandableSectionHeaderView(
      target: self,
      section: section,
      action: #selector(handleExpandClose),
      title: (dataSource?.affectedRoutes[section].routeId)!,
      frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.width, height: 36.0)),
      sectionViewState: sectionItem.isSectionExpanded
    )
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 36.0
  }
}
