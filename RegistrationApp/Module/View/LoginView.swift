//
//  LoginView.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: LoginControllerProtocol?
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "apple").withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        return UILabel(text: "Login", font: .systemFont(ofSize: 34, weight: .bold), textAlignment: .center)
    }()
    
    private let descLabel: UILabel = {
        return UILabel(text: "Welcome back, Sign in to continue etiam tacimates sed ad",
                            font: .systemFont(ofSize: 17, weight: .medium),
                            numberOfLines: 0,
                            textAlignment: .center,
                            textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6))
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContrainerView(textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private lazy var passwordContainerView: UIView = {
        return UIView().inputContrainerView(textField: passwordTextField)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign in ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Create account", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: Constants.mainBlue]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleDontHaveAccount), for: .touchUpInside)
        return button
    }()
    
    private let forgotPassButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(Constants.mainBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        button.addTarget(self, action: #selector(handleForgotPass), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        
        [iconImage, titleLabel, descLabel, stackView, dontHaveAccountButton, loginButton, forgotPassButton].forEach {
            addSubview($0)
        }
        
        iconImage.centerX(inView: self)
        iconImage.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 92, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 37, height: 44)
        
        titleLabel.centerX(inView: self)
        titleLabel.anchor(top: iconImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor,paddingTop: 35, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 41)
        
        descLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 44)
        
        stackView.anchor(top: descLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        dontHaveAccountButton.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 55, paddingRight: 16, height: 20)
        
        loginButton.anchor(top: nil, left: leftAnchor, bottom: dontHaveAccountButton.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, height: 56)
        
        forgotPassButton.anchor(top: stackView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 22, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 113, height: 18)
    }
    
    // MARK: - Selectors
    
    @objc func handleDontHaveAccount() {
        delegate?.moveToRegistrationPage()
    }
    
    @objc private func handleForgotPass() {
        delegate?.moveToForgotPass()
    }
}