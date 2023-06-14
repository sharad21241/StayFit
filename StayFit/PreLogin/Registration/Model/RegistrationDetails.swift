//
//  RegistrationDetails.swift
//  StayFit
//
//  Created by Sharad Gangurde on 24/05/23.
//

import Foundation
import Firebase

class User {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // You can add additional properties and methods as per your data structure
}

class RegistrationDetails {
    func fetchUserData(completion: @escaping (User?) -> Void) {
        // Assuming you have a reference to your Firebase Realtime Database
        let ref = Database.database().reference().child("users")
        
        ref.observeSingleEvent(of: .value, with: { (DataSnapshot) in
            if let userData = DataSnapshot.value as? [String: Any] {
                // Parse the data and create a UserData object
                let email = userData["email"] as? String ?? ""
                let password = userData["password"] as? String ?? ""
                let userDataObject = User(email: email, password: password)
                completion(userDataObject)
            } else {
                completion(nil)
            }
        })
    }
}





