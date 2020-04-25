//
//  RoundedView.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 19/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RoundedView: UIView {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addShadow()
  }
}
extension RoundedView {
  func addShadow() {
    self.backgroundColor = .white
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOpacity = 1
    layer.shadowOffset = .zero
    layer.shadowRadius = 10
    self.layer.cornerRadius = self.bounds.height / 2
  }
}
