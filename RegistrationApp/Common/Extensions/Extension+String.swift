//
//  Extension+String.swift
//  RegistrationApp
//
//  Created by rau4o on 5/22/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Foundation

extension String {

    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

