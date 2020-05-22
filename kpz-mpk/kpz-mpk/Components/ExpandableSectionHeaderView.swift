//
//  ExpandableSectionHeaderView.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 21/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class ExpandableSectionHeaderView: UIView {
  
  required init(target: Any?, section: Int, action: Selector, title: String, frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .systemYellow
    
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: CGSize(width: 50, height: 30))
    button.tag = section
    button.setTitle("Button", for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    
    let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 30)))
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = title
    
    self.addConstraint(NSLayoutConstraint(
      item: button,
      attribute: NSLayoutConstraint.Attribute.trailing,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: self,
      attribute: NSLayoutConstraint.Attribute.trailing,
      multiplier: 1.0, constant: -15))
    
    self.addConstraint(NSLayoutConstraint(
      item: label,
      attribute: NSLayoutConstraint.Attribute.centerY,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: self,
      attribute: NSLayoutConstraint.Attribute.centerY,
      multiplier: 1.0, constant: 0))
    
    self.addConstraint(NSLayoutConstraint(
      item: label,
      attribute: NSLayoutConstraint.Attribute.leading,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: self,
      attribute: NSLayoutConstraint.Attribute.leading,
      multiplier: 1.0, constant: 15))
    
    
    self.addSubview(label)
    self.addSubview(button)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
