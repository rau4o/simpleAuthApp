//
//  MainController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/23/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Firebase

class MainController: UIViewController {
    
    // MARK: - Properties
    
    var user: AuthDataResult?
    var mainView = MainView()
    var delegate: MainControllerProtocol?
    var viewModel = MainViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

extension MainController: MainControllerProtocol {
    
    func doneSignOut() {
        viewModel.signOut()
    }
    
    func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    func showErrorMessage(error: Error?) {
        showMessage(title: "Error", message: error?.localizedDescription)
    }
}

// MARK: - Helper function

private extension MainController {
    
    func initialSetup() {
        view.backgroundColor = .white
        configureNavBar()
        layoutUI()
        displayName()
        activateDelegates()
    }
    
    private func activateDelegates() {
        mainView.delegate = self
        viewModel.delegate = self
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func layoutUI() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func displayName() {
        mainView.nameLabel.text = "Hello \(user?.user.email ?? "user is nil")"
    }
}
