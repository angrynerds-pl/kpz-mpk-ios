//
//  UserMenuViewModel.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 03/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

final class UserMenuViewModel {
  
  private weak var presenter: UserMenuViewController?
  private let sessionManager: SessionManager
  
  init(presenter: UserMenuViewController?, sessionManager: SessionManager = SessionManager.shared) {
    self.presenter = presenter
    self.sessionManager = sessionManager
  }
  
  func logout() {
    sessionManager.auth0Logout()
    
    DispatchQueue.main.async {
      self.presenter?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
  }
  
}
