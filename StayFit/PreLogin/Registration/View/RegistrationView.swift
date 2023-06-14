//
//  RegistrationView.swift
//  StayFit
//
//  Created by Sharad Gangurde on 24/05/23.
//

import Foundation
protocol RegistrationView {
    func showUserData(_ user: User)
    func showNoDataAvailable()
    func successRegister()
    func showError(errorMessage: String)
}
