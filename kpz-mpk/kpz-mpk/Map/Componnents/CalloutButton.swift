//
//  CalloutButton.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 15/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class CalloutButton: UIButton {
  
  var incidentAnnotation: IncidentAnnotation
  
  required init(frame: CGRect, incidentAnnotation: IncidentAnnotation) {
    self.incidentAnnotation = incidentAnnotation
    super.init(frame: frame)
    self.setImage(UIImage(systemName: "info.circle"), for: .normal)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
