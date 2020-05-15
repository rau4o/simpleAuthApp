//
//  AuthButton.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        backgroundColor = UIColor.mainBlue
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
