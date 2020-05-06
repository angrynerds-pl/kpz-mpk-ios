//
//  ApiError.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 05/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct ApiError: Error, Codable {
  var statusCode: Int
  var error: String
  var message: String
}
