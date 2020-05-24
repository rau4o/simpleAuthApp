//
//  RegistrationController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Firebase

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    var registrationView = RegistrationView()
    var viewModel = RegistrationViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        activityIndicator.stopAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Protocols

extension RegistrationController: RegistrationControllerProtocol {
    func doneRegistr() {
        guard let nameText = registrationView.nameTextField.text else {return}
        guard let emailText = registrationView.emailTextField.text else {return}
        guard let passwordText = registrationView.passwordTextField.text else {return}
        viewModel.createUser(name: nameText, email: emailText, password: passwordText)
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func moveToLoginPage() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showMessage(error: Error?) {
        showMessage(title: "Error", message: error?.localizedDescription)
    }
}
    
// MARK: - LayoutUI

private extension RegistrationController {
    
    func initialSetup() {
        layoutUI()
        setupIndicatorView()
        activateDelegates()
    }
    
    private func activateDelegates() {
        registrationView.delegate = self
        viewModel.delegate = self
    }
    
    private func setupIndicatorView() {
        activityIndicator.hidesWhenStopped = true
    }
    
    private func layoutUI() {
        [registrationView, activityIndicator].forEach {
            view.addSubview($0)
        }
        
        registrationView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
}

