//
//  RegistrationPresenter.swift
//  StayFit
//
//  Created by Sharad Gangurde on 24/05/23.
//

import Foundation
import Firebase
import FirebaseAuth

/// This is presenter to save registration details
class RegistrationPresenter: NSObject {
    // Assuming you have a reference to your Firebase Realtime Database
    //let ref = Database.database().reference()
    let db = Firestore.firestore()
   
    var model: RegistrationDetails?
    
    //MARK: - Variable declaration
    fileprivate var objView : RegistrationView?
    
    /// Function to attach the view
    ///
    /// - Parameter view: GetUserDetails class object
    func attachView(_ view: RegistrationView) {
        objView = view
    }
    
    /// Function to release the view
    func detachView() {
        objView = nil
    }
    
    /// function call to save user details
    /// - Parameter userData: User
    func registerUser(userData: User) {
        self.objView?.showLoader()
        Auth.auth().createUser(withEmail: userData.email, password: userData.password) { authResult, error in
            if let error = error {
                // Handle error
                print("Registration error: \(error.localizedDescription)")
                self.objView?.showError(errorMessage: error.localizedDescription)
            } else {
                // Registration successful
                AuthManager.shared.email = authResult?.user.email
                AuthManager.shared.uid = authResult?.user.uid
                AuthManager.shared.displayName = authResult?.user.displayName
                AuthManager.shared.isNewUser = authResult?.additionalUserInfo?.isNewUser ?? false
                
                print(authResult as Any)
                Utils.shared.setUserDefault(key: "userId", value: AuthManager.shared.uid ?? "")
                print("Registration successful!")
                Utils.shared.setUserDefaultBoolValue(key: "isRegistered", value: true)
                self.objView?.successRegister()
            }
        }
        self.objView?.hideLoader()
    }
}
