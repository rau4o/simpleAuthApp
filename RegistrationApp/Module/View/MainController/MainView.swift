//
//  MainView.swift
//  RegistrationApp
//
//  Created by rau4o on 5/23/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MainControllerProtocol?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.backgroundColor = UIColor.mainBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignOut(_:)), for: .touchUpInside)
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
        addSubview(nameLabel)
        addSubview(signOutButton)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }
        
        signOutButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    @objc private func handleSignOut(_ sender: UIButton) {
        delegate?.doneSignOut()
    }
}
