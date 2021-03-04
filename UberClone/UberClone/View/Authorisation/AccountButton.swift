//
//  AccountButton.swift
//  UberClone
//
//  Created by Manan on 18/04/2020.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

///Creates bottom button for change from Login to Signup and vice versa
class AccountButton: UIButton {
    
    func setupLabel(question: String, actionName: String) {
        let attributedTitle = NSMutableAttributedString(string: "\(question) ",attributes:
                                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                                 NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: actionName, attributes:
                                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                                 NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint]))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
    

}
