//
//  AuthButton.swift
//  UberClone
//
//  Created by Manan on 18/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

///Creates a button for Login/SignUp
class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
