//
//  ExpandableSectionHeaderView.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 21/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class ExpandableSectionHeaderView: UIView {
  
  private enum Constants {
    static let margin: CGFloat = 25
    static let itemsHeight: CGFloat = 36
    static let titleFontSize: CGFloat = 19
    static let labelWidth: CGFloat = 50
    static let buttonWidth: CGFloat = 50
  }
  
  let expansionButton = UIButton(type: .system)
  let routeIdLabel = UILabel(
    frame: CGRect(
      origin: .zero,
      size: CGSize(width: Constants.labelWidth, height: Constants.itemsHeight)
  ))
  
  required init(
    target: Any?,
    section: Int,
    action: Selector,
    title: String,
    frame: CGRect,
    sectionViewState: SectionViewState
  ) {
    super.init(frame: frame)
    
    self.backgroundColor = sectionViewState.backgroundColor

    setButton(
      button: expansionButton,
      section: section,
      target: target,
      action: action,
      sectionViewState: sectionViewState)
    
    setLabel(
      label: routeIdLabel,
      title: title)
    
    NSLayoutConstraint().centerY(itemToCenter: routeIdLabel, view: self)
    NSLayoutConstraint().centerY(itemToCenter: expansionButton, view: self)
    
    self.addConstraint(NSLayoutConstraint(
      item: expansionButton,
      attribute: NSLayoutConstraint.Attribute.trailing,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: self,
      attribute: NSLayoutConstraint.Attribute.trailing,
      multiplier: 1.0, constant: -Constants.margin))
    
    self.addConstraint(NSLayoutConstraint(
      item: routeIdLabel,
      attribute: NSLayoutConstraint.Attribute.leading,
      relatedBy: NSLayoutConstraint.Relation.equal,
      toItem: self,
      attribute: NSLayoutConstraint.Attribute.leading,
      multiplier: 1.0, constant: Constants.margin))
    
    self.addSubview(routeIdLabel)
    self.addSubview(expansionButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setButton(
    button: UIButton,
    section: Int,
    target: Any?,
    action: Selector,
    sectionViewState: SectionViewState
  ) {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.frame = CGRect(origin: .zero, size: CGSize(width: Constants.buttonWidth, height: Constants.itemsHeight))
    button.tag = section
    button.setTitle(sectionViewState.buttonTitle, for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
  }
  
  func setLabel(label: UILabel, title: String) {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = title
    label.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
  }
}
