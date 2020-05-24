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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }
    }
}
