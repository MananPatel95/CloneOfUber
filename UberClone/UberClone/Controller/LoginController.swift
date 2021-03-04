//
//  LoginController.swift
//  UberClone
//
//  Created by Manan on 17/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    let authViewsHelper = AuthViewsHelper()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureNavigationBar()
        configureUI()
    }

    
    //MARK: - Configurations methods for UI
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    private func configureUI() {
        view.backgroundColor = .backgroundColour
        
        /* Create top title "UBER" */
        let titleLabel = authViewsHelper.titleLabel
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        /* Create stack for textfields containers */
        let loginButton = authViewsHelper.createActionButton(title: "Login", target: self, action: #selector(loginButtonPressed))
        let stack = UIStackView(arrangedSubviews: [authViewsHelper.emailContainerView,
                                                   authViewsHelper.passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, paddingTop: 40,
                     left: view.leftAnchor, paddingLeft: 16,
                     right: view.rightAnchor, paddingRight: 16)
        
        
        /* Add bottom button */
        let noAccountButton = authViewsHelper.createBottomButton(question: "Don't have an account?", actionName: "Sign Up",
                                                                 target: self, action: #selector(showSignUpPage))
        view.addSubview(noAccountButton)
        noAccountButton.centerX(inView: view)
        noAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }

    
    
    //MARK: - Selectors
    
    @objc private func loginButtonPressed() {
        guard let email = authViewsHelper.emailTextField.text else { return }
        guard let password = authViewsHelper.passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed login user, error: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Succesful login!")
            let rootController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController
            guard let controller = rootController as? HomeController else {return}
            controller.configure()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @objc func showSignUpPage() {
        let signupVC = SignUpController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
}
