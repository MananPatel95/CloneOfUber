//
//  UIColorExtensions.swift
//  UberClone
//
//  Created by Manan on 17/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

extension UIColor {

    static let backgroundColour = UIColor.rgb(red: 25, green: 25, blue: 25)
    static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
    
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

}
