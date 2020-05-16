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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
