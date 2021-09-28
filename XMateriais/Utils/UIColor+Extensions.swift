//
//  UIColor+Extensions.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func getPrimaryColor() -> UIColor {
        return UIColor(red: 0.87, green: 0.42, blue: 0.17, alpha: 1.00)
    }
    
    class func getSecondaryColor() -> UIColor {
        return UIColor(red: 0.25, green: 0.23, blue: 0.18, alpha: 1.00)
    }
    
    class func getSecondaryLightColor() -> UIColor {
        return UIColor(red:0.91, green:0.89, blue:0.85, alpha:1.00)
    }

    class func getGrayColor() -> UIColor {
        return UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.00)
    }
    
    class func getDisableColor() -> UIColor {
        return UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
    }
    
    class func getDisableBorderColor() -> UIColor {
        return UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.00)
    }
    
    class func getDisableTextColor() -> UIColor {
        return UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.00)
    }
    
    class func getDeselectRadioButtonColor() -> UIColor {
        return UIColor(red:1.00, green:0.85, blue:0.76, alpha:1.00)
    }
}
