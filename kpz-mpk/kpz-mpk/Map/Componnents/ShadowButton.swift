//
//  ShadowButton.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 20/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    super.layoutSubviews()
  }
  
  override func layoutSubviews() {
    backgroundColor = .white
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOpacity = 1
    layer.shadowOffset = .zero
    layer.shadowRadius = 10
  }
}
