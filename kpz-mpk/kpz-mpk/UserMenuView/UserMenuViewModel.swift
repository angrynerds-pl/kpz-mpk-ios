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
  
  init(presenter: UserMenuViewController?) {
    self.presenter = presenter
  }
  
  func auth0Logout() {
    SessionManager.shared.logout { error in
      
      guard error == nil else {
        _ = SessionManager.shared.credentialsManager.clear()
        return print("Error revoking token: \(String(describing: error))")
      }
      
      DispatchQueue.main.async {
        self.presenter?.presentingViewController?.dismiss(animated: true, completion: nil)
      }
    }
  }
  
}
