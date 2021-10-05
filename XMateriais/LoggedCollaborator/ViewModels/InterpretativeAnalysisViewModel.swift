//
//  InterpretativeAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit

class InterpretativeAnalysisViewModel {
    
    // MARK: Variable's Functions

    let kTitleAttrbuted = "Por que você escolheu a palavra "
    let kQuestion = "?"
    
    var firstChosenWord: String?
    var secondChosenWord: String?
    
    // MARK: Public Functions

    public func setAttributedText(choseWord: String) -> NSMutableAttributedString {
        let attrBlack = [ NSAttributedString.Key.foregroundColor: UIColor.black]
        let attrOrange = [ NSAttributedString.Key.foregroundColor: UIColor.getPrimaryColor()]
        let myAttrString = NSAttributedString(string: kTitleAttrbuted, attributes: attrBlack)
        let myAttrString2 = NSAttributedString(string: choseWord, attributes: attrOrange)
        let myAttrString3 = NSAttributedString(string: kQuestion, attributes: attrBlack)
        let combination = NSMutableAttributedString()
        combination.append(myAttrString)
        combination.append(myAttrString2)
        combination.append(myAttrString3)
        return combination
    }
}
