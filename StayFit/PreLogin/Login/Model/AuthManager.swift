//
//  AuthManager.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/06/23.
//

import Foundation
final class AuthManager {
    // Singleton instance
    static let shared = AuthManager()
    
    // Private initializer to prevent direct instantiation
    private init() {}
    
    // Store authResult properties or any other relevant data
    var user: String?
    var additionalUserInfo: String?
    var uid: String?
    var email: String?
    var displayName: String?
    var isNewUser: Bool = false
}
