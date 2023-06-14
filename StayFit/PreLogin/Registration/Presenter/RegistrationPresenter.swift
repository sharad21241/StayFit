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
    
    func fetchUserData() {
        model?.fetchUserData { [weak self] (user) in
            if let user = user {
                self?.objView?.showUserData(user)
            } else {
                self?.objView?.showNoDataAvailable()
            }
        }
    }
    
    /// function call to save user details
    /// - Parameter userData: User
    func setUserData(userData: User) {
        
        // JSON object data
//        let jsonObject: [String: Any] = [
//            "email": userData.email,
//            "password": userData.password,
//        ]
        
        //Firestore DB
        // Write the JSON object to Firestore
//        db.collection("UserDetails").document("User").setData(jsonObject) { error in
//            if let error = error {
//                //print("Error writing document: \(error)")
//                self.objView?.showError(errorMessage: "Unable to register, Try again!")
//            } else {
//                //print("Document successfully written!")
//                self.objView?.successRegister()
//            }
//        }
        
        Auth.auth().createUser(withEmail: userData.email, password: userData.password) { authResult, error in
            if let error = error {
                // Handle registration error
                print("Registration error: \(error.localizedDescription)")
                self.objView?.showError(errorMessage: error.localizedDescription)
            } else {
                // Registration successful
                // Proceed with necessary actions for a successful registration
                print("Registration successful!")
                Utils.shared.setUserDefaultBoolValue(key: "isRegistered", value: true)
                self.objView?.successRegister()
            }
        }
    }
}
