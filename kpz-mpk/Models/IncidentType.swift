//
//  IncidentType.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 17/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

enum IncidenType: String, Codable {
  case other
  case derailment
  case collision
  case noElectricity = "no_electricity"
  case trackDamage = "track_damage"
  case noPassage = "no_passage"
}
