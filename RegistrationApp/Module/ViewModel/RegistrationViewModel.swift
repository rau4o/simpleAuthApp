//
//  RegistrationViewModel.swift
//  RegistrationApp
//
//  Created by rau4o on 5/22/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import FirebaseAuth

class RegistrationViewModel {
    
    var delegate: RegistrationControllerProtocol?
    
    func createUser(name: String, email: String, password: String) {
        delegate?.startActivityIndicator()
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.delegate?.showMessage(error: error)
                return
            }
            self.delegate?.stopActivityIndicator()
            self.delegate?.moveToLoginPage()
        }
    }
}
