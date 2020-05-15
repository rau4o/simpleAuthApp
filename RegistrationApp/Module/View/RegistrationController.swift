//
//  RegistrationController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    var registrationView = RegistrationView()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        registrationView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(registrationView)
        
        registrationView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

extension RegistrationController: RegistrationControllerProtocol {
    func moveToLoginPage() {
        self.navigationController?.popViewController(animated: true)
    }
}
    

