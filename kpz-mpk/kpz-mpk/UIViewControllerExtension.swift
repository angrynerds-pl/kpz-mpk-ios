//
//  UIViewControllerExtension.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 06/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import UIKit

protocol ErrorPresenting {
   func present(error: ApiError)
}

extension UIViewController {
  func showApiError(error: ApiError) {
    let alert = UIAlertController(
      title: "\(String(error.statusCode)) \(error.error)",
      message: error.message,
      preferredStyle: .alert
    )
    alert.addAction(
      UIAlertAction(
        title: NSLocalizedString("OK", comment: "Default action"),
        style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")}
      )
    )
    self.present(alert, animated: true, completion: nil)
  }
}

extension UIViewController: ErrorPresenting {
  func present(error: ApiError) {
    showApiError(error: error)
  }
}
