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
  func rateViewButtonClicked()
}

class RateView: UIStackView {
  weak var delegate: RateViewDelegate?
  
  let rateButton = UIButton(type: .system)
  let rateLabel = UILabel()
  
  var rateButtonImage: UIImage?
  var rateButtonSelectedImage: UIImage?
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    
    rateButton.addTarget(self, action: #selector(rateButtonClicked), for: .touchUpOutside)
    
    setRateButton(buttonState: .disabled)
    setRateLabelText(text: "0")
    
    self.addArrangedSubview(rateButton)
    self.addArrangedSubview(rateLabel)
  }
  
  func setRateButton(buttonState: rateButtonState) {
    switch buttonState {
    case .disabled:
      rateButton.isEnabled = false
      rateButton.setImage(rateButtonImage, for: .normal)
    case .enabled:
      rateButton.isEnabled = true
      rateButton.setImage(rateButtonImage, for: .normal)
    case .selected:
      rateButton.isEnabled = true
      rateButton.setImage(rateButtonSelectedImage, for: .normal)
    }
  }
  
  func setRateLabelText(text: String) {
    rateLabel.text = text
    rateLabel.textAlignment = .center
  }
  
  @objc func rateButtonClicked() {
    delegate?.rateViewButtonClicked()
  }
  
}
