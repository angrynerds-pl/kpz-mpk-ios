//
//  Incident.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 11/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

enum IncidenType: String, Codable {
  case other = "other"
  case derailment = "derailment"
  case collision = "collision"
  case noElectricity = "no_electricity"
  case trackDamage = "track_damage"
  case noPassage = "no_passage"
}

struct Incident: Codable {
  let id: String // Change to Int when API will be changed
  let description: String
  let type: IncidenType
}
