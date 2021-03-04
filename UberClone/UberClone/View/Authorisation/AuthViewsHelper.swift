//
//  LoginViewesHelpers.swift
//  UberClone
//
//  Created by Manan on 19/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

/// Provides necessary UI elements for Authorisation pages
class AuthViewsHelper {
    
    //MARK: - Public Views
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "envelope") ?? #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    lazy var fullnameContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "person") ?? #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "lock") ?? #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(systemName: "person.crop.square.fill") ?? #imageLiteral(resourceName: "ic_person_outline_white_2x"), segmentedControl: accountTypeSegmentedControl)  // 􀉺
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    
    let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = .backgroundColour
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.backgroundColour], for: .selected)
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    
    
    let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    let fullnameTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Full Name", isSecureTextEntry: false)
    }()
    
    let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    
    
    
    //MARK: - Public methods
    
    func createActionButton(title: String, target: Any?, action: Selector) -> AuthButton {
        let button = AuthButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
    func createBottomButton(question: String, actionName: String, target: Any?, action: Selector) -> AccountButton {
        let button = AccountButton(type: .system)
        button.setupLabel(question: "Already have an account?", actionName: "Login")
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
    
    
}
