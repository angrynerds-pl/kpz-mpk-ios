//
//  SesionManager.swift
//  kpz-mpk
//
//  Created by Wojciech Konury on 01/05/2020.
//  Copyright © 2020 kpz-mpk. All rights reserved.
//

import Foundation
import SimpleKeychain
import Auth0

class SessionManager {
  static let shared = SessionManager()
  private let authentication = Auth0.authentication()
  let credentialsManager: CredentialsManager!
  var profile: UserInfo?
  var credentials: Credentials?
  
  private init () {
    self.credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    _ = self.authentication.logging(enabled: true) // API Logging
  }
  
  func auth0Login() {
    if !SessionManager.shared.credentialsManager.hasValid() {
      Auth0
        .webAuth()
        .scope("openid profile offline_access")
        .audience("https://kpz-mpk.eu.auth0.com/userinfo")
        .parameters(["prompt": "login"])
        .start {
          switch $0 {
          case .failure(let error):
            // Handle the error
            print("Error: \(error)")
          case .success(let credentials):
            if !SessionManager.shared.store(credentials: credentials) {
              print("Failed to store credentials")
            }
          }
      }
    } else {
      return
    }
  }
  
  func auth0Logout() {
    SessionManager.shared.logout { error in
      
      guard error == nil else {
        _ = SessionManager.shared.credentialsManager.clear()
        return print("Error revoking token: \(String(describing: error))")
      }
    }
  }
  
  func renewAuth(_ callback: @escaping (Error?) -> ()) {
    // Check it is possible to return credentials before asking for Touch
    guard self.credentialsManager.hasValid() else {
      return callback(CredentialsManagerError.noCredentials)
    }
    self.credentialsManager.credentials { error, credentials in
      guard error == nil, let credentials = credentials else {
        return callback(error)
      }
      self.credentials = credentials
      callback(nil)
    }
  }
  
  private func retrieveProfile(_ callback: @escaping (Error?) -> ()) {
    guard let accessToken = self.credentials?.accessToken
      else { return callback(CredentialsManagerError.noCredentials) }
    self.authentication
      .userInfo(withAccessToken: accessToken)
      .start { result in
        switch result {
        case .success(let profile):
          self.profile = profile
          callback(nil)
        case .failure(let error):
          callback(error)
        }
    }
  }
  
 private func logout(_ callback: @escaping (Error?) -> Void) {
    // Remove credentials from KeyChain
    self.credentials = nil
    self.credentialsManager.revoke(callback)
  }
  
  private func store(credentials: Credentials) -> Bool {
    self.credentials = credentials
    // Store credentials in KeyChain
    return self.credentialsManager.store(credentials: credentials)
  }
}

private func plistValues(bundle: Bundle) -> (clientId: String, domain: String)? {
  guard
    let path = bundle.path(forResource: "Auth0", ofType: "plist"),
    let values = NSDictionary(contentsOfFile: path) as? [String: Any]
    else {
      print("Missing Auth0.plist file with 'ClientId' and 'Domain' entries in main bundle!")
      return nil
  }
  
  guard
    let clientId = values["ClientId"] as? String,
    let domain = values["Domain"] as? String
    else {
      print("Auth0.plist file at \(path) is missing 'ClientId' and/or 'Domain' entries!")
      print("File currently has the following entries: \(values)")
      return nil
  }
  return (clientId: clientId, domain: domain)
}
