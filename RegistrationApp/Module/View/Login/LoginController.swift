//
//  LoginController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    var loginView = LoginView()
    let registrationController = RegistrationController()
    var viewModel = LoginViewModel()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    let mainController = MainController()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        viewModel.delegate = self
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavbar()
    }
}

// MARK: - Protocols

extension LoginController: LoginControllerProtocol {
    
    func doneLogin() {
        guard let emailText = loginView.emailTextField.text else {return}
        guard let passwordText = loginView.passwordTextField.text else {return}
        viewModel.signIn(email: emailText, password: passwordText)
    }
    
    func moveToMain(user: AuthDataResult) {
        mainController.user = user
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func showMessage(error: Error?) {
        showMessage(message: error?.localizedDescription)
    }
    
    func moveToForgotPass() {
        navigationController?.pushViewController(ForgotPasswordController.shared, animated: true)
    }
    
    func moveToRegistrationPage() {
        navigationController?.pushViewController(self.registrationController, animated: true)
    }
}

// MARK: - LayoutUI

private extension LoginController {
    
    func initialSetup() {
        layoutUI()
        configureNavbar()
        activityIndicator.stopAnimating()
    }
    
    func configureNavbar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func layoutUI() {
        [loginView, activityIndicator].forEach {
            view.addSubview($0)
        }
        
        loginView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
}
