//
//  ForgotPasswordViewModel.swift
//  RegistrationApp
//
//  Created by rau4o on 5/24/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import FirebaseAuth

class ForgotPasswordViewModel {
    
    weak var delegate: ForgotPasswordProtocol?
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                self.delegate?.showMessageFail(error: error)
            }
            self.delegate?.showMessageSuccess()
            self.delegate?.moveToLogin()
        }
    }
}
