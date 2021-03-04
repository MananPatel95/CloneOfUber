//
//  LocationInputActivationView.swift
//  UberClone
//
//  Created by Manan on 19/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

protocol LocationInputActivationViewDelegate: AnyObject {
    func presentLocationInputView()
}

class LocationInputActivationView: UIView {
    
    
    weak var delegate: LocationInputActivationViewDelegate?
    
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.applyShadow(color: .black, alpha: 0.45, x: 0.5, y: 0.5, blur: 8)
        
        addSubview(indicatorView)
        indicatorView.anchor(left: leftAnchor, paddingLeft: 16,
                             width: 6, height: 6)
        indicatorView.centerY(inView: self)
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(left: indicatorView.rightAnchor, paddingLeft: 20)
        placeholderLabel.centerY(inView: self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLocationInputView))
        addGestureRecognizer(tapGesture)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: - Selectors
    
    @objc private func showLocationInputView() {
        delegate?.presentLocationInputView()
    }
    
}
