//
//  CALayerExtensions.swift
//  UberClone
//
//  Created by Manan on 19/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit


//MARK: - Extension for shadow effect
extension CALayer {
  func applyShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 6) {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    
    masksToBounds = false
    
    shouldRasterize = true
    rasterizationScale = UIScreen.main.scale
  }
}
