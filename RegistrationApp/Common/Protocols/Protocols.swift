//
//  Protocols.swift
//  RegistrationApp
//
//  Created by rau4o on 5/15/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

protocol LoginControllerProtocol: class {
    func moveToForgotPass()
    func moveToRegistrationPage()
}

protocol RegistrationControllerProtocol: class {
    func moveToLoginPage()
}

protocol ForgotPasswordProtocol: class {
    func moveToLogin()
}
