//
//  ForgotPassView.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class ForgotPassView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ForgotPasswordProtocol?
    
    private let titleLabel: UILabel = {
        return UILabel(text: "Forgot Password?", font: .systemFont(ofSize: 34, weight: .bold), textAlignment: .center)
    }()
    
    private let descLabel: UILabel = {
        return UILabel(text: "Mel ea numquam efficiendi appellantur, eu vix reque inermis propriae, animal scaevola.",
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
    
    private let continueButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
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
        
        [titleLabel, descLabel, emailContainerView, continueButton].forEach {
            addSubview($0)
        }
        
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 64, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 41)
        
        descLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 44)
        
        emailContainerView.anchor(top: descLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, height: 60)
        
        continueButton.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 53, paddingRight: 16, height: 56)
    }
    
    // MARK: - Selectors
    
    @objc private func handleContinue() {
        delegate?.moveToLogin()
    }
}
