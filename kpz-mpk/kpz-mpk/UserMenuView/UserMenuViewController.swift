//
//  UserMenuViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 01/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {
  @IBOutlet private weak var tokenLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tokenLabel.text = SessionManager.shared.credentials?.accessToken ?? "Token here"
  }
  
  @IBAction private func logoutButtonPressed(_ sender: UIButton) {
    SessionManager.shared.logout { error in
      
      guard error == nil else {
        SessionManager.shared.credentialsManager.clear()
        return print("Error revoking token: \(String(describing: error))")
      }
      
      DispatchQueue.main.async {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
