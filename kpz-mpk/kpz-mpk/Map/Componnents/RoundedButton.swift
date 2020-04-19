//
//  RoundedButton.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 18/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.backgroundColor = .white
    addShadow()
  }
}

extension RoundedButton {
  
  func roundLeft() {
    self.layer.cornerRadius = self.bounds.height / 2
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    
    self.tintColor = .systemRed
  }
  
  func roundRight() {
    self.layer.cornerRadius = self.bounds.height / 2
    self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    
    self.tintColor = .systemGreen
  }
  
  func roundAll() {
    self.layer.cornerRadius = self.bounds.height / 2
  }
  
  func addShadow() {
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOpacity = 1
    layer.shadowOffset = .zero
    layer.shadowRadius = 10
  }

}
