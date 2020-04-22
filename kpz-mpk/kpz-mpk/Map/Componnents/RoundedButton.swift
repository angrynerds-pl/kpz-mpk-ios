//
//  RoundedButton.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 18/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class RoundedButton: ShadowButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.bounds.height / 2
  }
}
