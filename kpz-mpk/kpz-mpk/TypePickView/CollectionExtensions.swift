//
//  CollectionExtensions.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 25/04/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
      return indices.contains(index) ? self[index] : nil
  }
}
