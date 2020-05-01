//
//  UserMenuViewController.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 01/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {
    @IBOutlet weak var tokenLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    SessionManager.shared.credentialsManager.credentials { error, credentials in
        guard error == nil, let credentials = credentials else {
            // Handle Error, Present Login Page
          return
        }
      self.tokenLabel.text = SessionManager.shared.credentials?.accessToken ?? "Dudud"
    }
  }
  

  @IBAction private func logoutButtonPressed(_ sender: UIButton) {
    SessionManager.shared.logout { error in
      
      guard error == nil else {
        return print("Error revoking token: \(String(describing: error))")
      }
      
      DispatchQueue.main.async {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
