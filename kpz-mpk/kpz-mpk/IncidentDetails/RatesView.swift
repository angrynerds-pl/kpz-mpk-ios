//
//  RatesView.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 07/06/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

enum rateButtonState {
  case disabled
  case enabled
  case selected
}

protocol RateViewDelegate: AnyObject {
  func rateViewButtonClicked(rateButtonType: RateType?)
}

class RateView: UIStackView {
  weak var delegate: RateViewDelegate?
  
  let rateButton = UIButton(type: .system)
  let rateLabel = UILabel()
  
  private var rateButtonType: RateType?
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    
    rateButton.addTarget(self, action: #selector(rateButtonClicked), for: .touchUpInside)
    
    setRateButton(buttonState: .disabled)
    setRateLabelText(text: "0")
    
    self.addArrangedSubview(rateButton)
    self.addArrangedSubview(rateLabel)
  }
  
  func setRateButton(buttonState: rateButtonState) {
    switch buttonState {
    case .disabled:
      rateButton.isEnabled = false
      rateButton.setImage(rateButtonType?.rateButtonDefaultImage, for: .normal)
    case .enabled:
      rateButton.isEnabled = true
      rateButton.setImage(rateButtonType?.rateButtonDefaultImage, for: .normal)
    case .selected:
      rateButton.isEnabled = true
      rateButton.setImage(rateButtonType?.rateButtonSelectedImage, for: .normal)
    }
  }
  
  func setRateLabelText(text: String) {
    rateLabel.text = text
    rateLabel.textAlignment = .center
  }
  
  func setRateButtonType(buttonType: RateType) {
    self.rateButtonType = buttonType
    rateButton.setImage(rateButtonType?.rateButtonDefaultImage, for: .normal)
  }
  
  @objc func rateButtonClicked() {
    delegate?.rateViewButtonClicked(rateButtonType: rateButtonType)
  }
  
}
