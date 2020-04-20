//
//  IncidentType.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 17/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

enum IncidenType: String, Codable {
  case other
  case derailment
  case collision
  case noElectricity = "no_electricity"
  case trackDamage = "track_damage"
  case noPassage = "no_passage"
  
  var image: UIImage? {
    switch self {
    case .collision:
      return UIImage(named: "collision")
    case .derailment:
      return UIImage(named: "derailment")
    case .noElectricity:
      return UIImage(named: "noElectricity")
    case .noPassage:
      return UIImage(named: "otherIncident")
    case .trackDamage:
      return UIImage(named: "trackDamage")
    case .other:
      return UIImage(named: "otherIncident")
    }
  }
}
