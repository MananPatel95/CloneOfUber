//
//  UIViewExtensions.swift
//  UberClone
//
//  Created by Manan on 17/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Creating a field for Login/SignUp pages
     - Parameter image: Image icon to be used on the left to the textField
     - Parameter textField: TextField that should be shown
     */
    func inputContainerView(image: UIImage, textField: UITextField? = nil,
                            segmentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        imageView.tintColor = .white
        view.addSubview(imageView)
        
        
        if let textField = textField {
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(textField)
            textField.centerY(inView: view)
            textField.anchor(left: imageView.rightAnchor, paddingLeft: 8,
                             bottom: view.bottomAnchor, paddingBottom: 8,
                             right: view.rightAnchor)
        }
        
        if let sc = segmentedControl {
            imageView.anchor(top: view.topAnchor, paddingTop: 0,
                             left: view.leftAnchor, paddingLeft: 8,
                             width: 24, height: 24)
            
            view.addSubview(sc)
            sc.anchor(left: view.leftAnchor, paddingLeft: 8,
                      right: view.rightAnchor, paddingRight: 8)
            sc.centerY(inView: view, constant: 8)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, paddingLeft: 8,
                             bottom: view.bottomAnchor,
                             right: view.rightAnchor,
                             height: 0.75)
        
        return view
    }
    
    
    //MARK: - Anchor methods
    
    
    /**
    Helper that anchors and sets up width and height
    - Parameter top: Top anchor
    - Parameter paddingTop: padding for the top
    - Parameter left: Left anchor
    - Parameter paddingLeft: padding for the left
    - Parameter bottom:
    - Parameter paddingBottom
    - Parameter right:
    - Parameter paddingRight:
    - Parameter width:
    - Parameter height:
    */
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                left: NSLayoutXAxisAnchor? = nil,
                paddingLeft: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat = 0,
                right: NSLayoutXAxisAnchor? = nil,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
}
