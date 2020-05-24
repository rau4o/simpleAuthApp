//
//  ForgotPasswordController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    // MARK: - Properties
    
    static let shared = ForgotPasswordController()
    var forgotPassView = ForgotPassView()
    let viewModel = ForgotPasswordViewModel()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension ForgotPasswordController: ForgotPasswordProtocol {
    func doneResetPassword() {
        guard let email = forgotPassView.emailTextField.text else {return}
        viewModel.resetPassword(email: email)
    }
    
    func showMessageSuccess() {
        showMessage(title: "Success", message: "Please check your email")
    }
    
    func showMessageFail(error: Error?) {
        showMessage(title: "Error", message: error?.localizedDescription)
    }
    
    func moveToLogin() {
        navigationController?.popViewController(animated: true)
    }
}

private extension ForgotPasswordController {
    
    func initialSetup() {
        title = "Password reset"
        layoutUI()
        activateDelegates()
    }
    
    private func activateDelegates() {
        forgotPassView.delegate = self
        viewModel.delegate = self
    }
    
    private func layoutUI() {
        view.addSubview(forgotPassView)
            
        forgotPassView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
