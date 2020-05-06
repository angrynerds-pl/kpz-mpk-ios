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
  
  lazy var viewModel = UserMenuViewModel(presenter: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Debug purpose
    self.tokenLabel.text = SessionManager.shared.credentials?.accessToken ?? "Token here"
  }
  
  @IBAction private func logoutButtonPressed(_ sender: UIButton) {
    viewModel.logout()
  }
}
