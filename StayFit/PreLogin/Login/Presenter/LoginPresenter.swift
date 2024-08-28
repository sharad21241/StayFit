//
//  LoginPresenter.swift
//  StayFit
//
//  Created by Sharad Gangurde on 13/06/23.
//

import Foundation
import FirebaseAuth

protocol LoginView: BaseView {
    func loginSuccess()
}

class LoginPresenter: NSObject {
   
    var model: RegistrationDetails?
    
    //MARK: - Variable declaration
    fileprivate var objView : LoginView?
    
    /// Function to attach the view
    ///
    /// - Parameter view: GetUserDetails class object
    func attachView(_ view: LoginView) {
        objView = view
    }
    
    /// Function to release the view
    func detachView() {
        objView = nil
    }
    
    /// function call to save user details
    /// - Parameter userData: User
    func login(userData: User) {
        self.objView?.showLoader()
        //Check user account exists
        Auth.auth().fetchSignInMethods(forEmail: userData.email) { signInMethods, error in
            if let error = error {
                // Handle error
                print("Error fetching sign-in methods: \(error.localizedDescription)")
            } else {
                if let signInMethods = signInMethods, !signInMethods.isEmpty {
                    // User account exists, proceed with login
                    Auth.auth().signIn(withEmail: userData.email, password: userData.password) { authResult, error in
                        if let error = error {
                            // Handle login error
                            self.objView?.hideLoader()
                            print("Login error: \(error.localizedDescription)")
                            self.objView?.showError(errorMessage: error.localizedDescription)
                        } else if let authResult = authResult {
                            // Login successful
                            AuthManager.shared.email = authResult.user.email
                            AuthManager.shared.uid = authResult.user.uid
                            AuthManager.shared.displayName = authResult.user.displayName
                            AuthManager.shared.isNewUser = authResult.additionalUserInfo?.isNewUser ?? false
                            Utils.shared.setUserDefault(key: "userId", value: AuthManager.shared.uid ?? "")
                            // Proceed with necessary actions for a successful login
                            print("Login successful!")
                            self.objView?.hideLoader()
                            self.objView?.loginSuccess()
                        }
                    }
                    // Prompt the user for their password and attempt login
                } else {
                    // User account does not exist
                    self.objView?.hideLoader()
                    // Show an appropriate error message to the user
                    self.objView?.showError(errorMessage: "The use may have been deleted or does not exists. Register again")
                }
            }
        }
    }
    
    /// function call to save user details
    /// - Parameter userData: User
    func forgotPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                // Handle password reset error
                print("Password reset error: \(error.localizedDescription)")
                self.objView?.showError(errorMessage: error.localizedDescription)
            } else {
                // Password reset email sent successfully
                // Provide feedback to the user, e.g., show a success message
                print("Password reset email sent to \(email)!")
                self.objView?.showError(errorMessage: "Password reset email sent to \(email)")
            }
        }
    }
}
