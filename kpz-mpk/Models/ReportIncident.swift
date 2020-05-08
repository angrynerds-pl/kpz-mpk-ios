//
//  ReportIncident.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 08/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation

struct ReportIncident: Codable {
  let description: String
  let type: IncidenType
  let location: IncidentLocation
  let routeId: String
  let tripHeadsign: String
}
