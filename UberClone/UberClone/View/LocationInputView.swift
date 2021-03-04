//
//  LocationInputView.swift
//  UberClone
//
//  Created by Manan on 19/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

protocol LocationInputViewDelegate: AnyObject {
    func dismissLocationInputView()
    func executeSearch(query: String)
}


class LocationInputView: UIView {

    weak var delegate: LocationInputViewDelegate?
    
    var user: User? {
        didSet {
            titleLabel.text = user?.fullname
        }
    }
    
    
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)) ?? #imageLiteral(resourceName: "baseline_arrow_back_black_36dp-1"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let startLocationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let linkingView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let destinationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var startingLocationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Current Location"
        textField.backgroundColor = UIColor.rgb(red: 239, green: 239, blue: 244)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isEnabled = false
        
        let paddingView = UIView()
        paddingView.anchor(width: 8, height: 30)
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var destinationLocationTextField: UITextField = {
        let textField = UITextField()
        
        textField.delegate = self
        
        textField.placeholder = "Enter a destination.."
        textField.backgroundColor = UIColor.rgb(red: 210, green: 210, blue: 215)
        textField.returnKeyType = .search
        textField.font = UIFont.systemFont(ofSize: 14)
        
        let paddingView = UIView()
        paddingView.anchor(width: 8, height: 30)
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    
    
    
    //MARK: - Lyfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.applyShadow(color: .black, alpha: 0.45, x: 0.5, y: 0.5, blur: 8)
        backgroundColor = .white
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, paddingTop: 44,
                          left: leftAnchor, paddingLeft: 12,
                          width: 25, height: 25)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: backButton)
        titleLabel.centerX(inView: self)
        
        addSubview(startingLocationTextField)
        startingLocationTextField.anchor(top: titleLabel.bottomAnchor, paddingTop: 12,
                                         left: leftAnchor, paddingLeft: 50,
                                         right: rightAnchor, paddingRight: 50,
                                         height: 30)
        
        addSubview(destinationLocationTextField)
        destinationLocationTextField.anchor(top: startingLocationTextField.bottomAnchor, paddingTop: 12,
                                            left: startingLocationTextField.leftAnchor,
                                            height: 30)
        destinationLocationTextField.widthAnchor.constraint(equalTo: startingLocationTextField.widthAnchor).isActive = true
        
        addSubview(startLocationIndicatorView)
        startLocationIndicatorView.anchor(left: leftAnchor, paddingLeft: 22,
                                          width: 6, height: 6)
        startLocationIndicatorView.centerY(inView: startingLocationTextField)
        startLocationIndicatorView.layer.cornerRadius = 3
        
    
        addSubview(destinationIndicatorView)
        destinationIndicatorView.anchor(left: leftAnchor, paddingLeft: 22,
                                          width: 6, height: 6)
        destinationIndicatorView.centerY(inView: destinationLocationTextField)
        
        addSubview(linkingView)
        linkingView.centerX(inView: startLocationIndicatorView)
        linkingView.anchor(top: startLocationIndicatorView.bottomAnchor, paddingTop: 4,
                           bottom: destinationIndicatorView.topAnchor, paddingBottom: 4,
                           width: 0.5)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -  Selectors
    
    @objc private func backButtonPressed() {
        delegate?.dismissLocationInputView()
    }
}



//MARK: - UITextFieldDelegate

extension LocationInputView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text else { return false }
        delegate?.executeSearch(query: query)
        return true
    }
}
