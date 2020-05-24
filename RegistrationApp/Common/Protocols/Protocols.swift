//
//  Protocols.swift
//  RegistrationApp
//
//  Created by rau4o on 5/15/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol LoginControllerProtocol: class {
    func moveToMain(user: AuthDataResult)
    func moveToForgotPass()
    func moveToRegistrationPage()
    func startActivityIndicator()
    func stopActivityIndicator()
    func doneLogin()
    func showMessage(error: Error?)
}

protocol RegistrationControllerProtocol: class {
    func moveToLoginPage()
    func startActivityIndicator()
    func stopActivityIndicator()
    func doneRegistr()
    func showMessage(error: Error?)
}

protocol ForgotPasswordProtocol: class {
    func moveToLogin()
    func showMessageSuccess()
    func showMessageFail(error: Error?)
    func doneResetPassword()
}

protocol MainControllerProtocol: class {
    func dismissVC()
    func showErrorMessage(error: Error?)
    func doneSignOut()
}
