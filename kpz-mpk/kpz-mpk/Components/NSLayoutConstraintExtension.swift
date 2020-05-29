//
//  NSLayoutConstraintExtension.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 29/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
  func centerY(itemToCenter item: UIView, view: UIView) {
    view.addConstraint(NSLayoutConstraint(
      item: item,
      attribute: NSLayoutConstraint.Attribute.centerY,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: view,
      attribute: NSLayoutConstraint.Attribute.centerY,
      multiplier: 1.0, constant: 0))
  }
}
