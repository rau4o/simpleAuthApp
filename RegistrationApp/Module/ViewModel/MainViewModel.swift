//
//  MainViewModel.swift
//  RegistrationApp
//
//  Created by rau4o on 5/24/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import FirebaseAuth

class MainViewModel {
    
    weak var delegate: MainControllerProtocol?
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            delegate?.dismissVC()
        } catch let error {
            delegate?.showErrorMessage(error: error)
        }
    }
}
