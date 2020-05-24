//
//  Alert.swift
//  RegistrationApp
//
//  Created by rau4o on 5/22/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UIViewController {
    func showMessage(title: String? = nil, message: String?) {
        let alertController = UIAlertController(title: title ?? "MaNaDr", message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
}

//struct Alert {
//    private static func showBasicAlert(on vc: UIViewController, title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(action)
//        vc.present(alert, animated: true, completion: nil)
//    }
//
//    static func showSuccessRegistration(vc: UIViewController) {
//        Alert.showBasicAlert(on: vc, title: "Success Registration", message: "Move to Login Page and login")
//    }
//
//    static func showInvaliedEmailOrPassoword(vc: UIViewController) {
//        Alert.showBasicAlert(on: vc, title: "Incorrect email or password", message: "Please check your email or password")
//    }
//
//    static func showErrorOnRegistration(vc: UIViewController) {
//        Alert.showBasicAlert(on: vc, title: "Something is went wrong", message: "Please check something")
//    }
//}
