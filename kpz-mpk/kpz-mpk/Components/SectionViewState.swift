//
//  SectionViewState.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 21/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

enum SectionViewState {
  case expanded
  case notExpanded
  
  var buttonTitle: String {
    switch self {
    case .expanded:
      return "Close"
    case .notExpanded:
      return "Open"
    }
  }
  
  var futureButtonTitle: String {
    switch self {
    case .expanded:
      return "Open"
    case .notExpanded:
      return "Close"
    }
  }
  
  var backgroundColor: UIColor {
    switch self {
    case .expanded:
      return .secondarySystemBackground
    case .notExpanded:
      return .white
    }
  }
  
  var futureBackgroundColor: UIColor {
    switch self {
    case .expanded:
      return .white
    case .notExpanded:
      return .secondarySystemBackground
    }
  }
}
