//
//  CalloutButton.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 15/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class CalloutButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    self.setImage(UIImage(systemName: "info.circle"), for: .normal)
  }
}
