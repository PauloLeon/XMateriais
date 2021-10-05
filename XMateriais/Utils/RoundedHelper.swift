//
//  RoundedHelper.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RoundedHelper: NSObject {

    static func roundView(view: UIView) {
        view.layer.cornerRadius = 2.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        view.layer.masksToBounds = true
    }
    
    static func roundContinueButton(button: UIButton) {
        button.layer.cornerRadius = 3.0
        button.backgroundColor = UIColor.getPrimaryColor()
        button.layer.borderColor = UIColor.getPrimaryColor().cgColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.masksToBounds = true
    }
    
    static func roundDisableContinueButton(button: UIButton, titleColor: UIColor = UIColor.getGrayColor()) {
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = UIColor.white
    }

    static func roundButtons(button: UIButton) {
        button.layer.cornerRadius = button.layer.bounds.size.width/2
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.masksToBounds = true
    }
}
