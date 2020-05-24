//
//  LoginViewModel.swift
//  RegistrationApp
//
//  Created by rau4o on 5/23/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import FirebaseAuth

class LoginViewModel {
    
    var delegate: LoginControllerProtocol?
    
    func signIn(email: String, password: String) {
        self.delegate?.startActivityIndicator()
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.delegate?.showMessage(error: error)
                return
            }
            guard let result = result else {return}
            self.delegate?.stopActivityIndicator()
            self.delegate?.moveToMain(user: result)
        }
    }
}
