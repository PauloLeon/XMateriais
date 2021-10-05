//
//  FinalViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit

class FinalViewModel {
    
    // MARK: Variable's Functions
    
    let kTitleAttrbuted = "Por que você escolheu a palavra "
    let kQuestion = "?"
    let kPlaceholder = "Informe a descrição"
    
    var firstChosenWord: String?
    var secondChosenWord: String?
    var thirdChosenWord: String?
    var dataModel: RegisterDataModel = RegisterDataModel()
    
    // MARK: Init Functions
    
    init() {
        firstChosenWord = ""
        secondChosenWord = ""
        thirdChosenWord = ""
        dataModel = RegisterDataModel()
    }
    
    // MARK: Public Functions
    
    func setAttributedText(choseWord: String) -> NSMutableAttributedString {
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
    
    func resetAllSensations() {
        firstChosenWord = ""
        secondChosenWord = ""
        thirdChosenWord = ""
    }
    
    func validForm(text1: String, text2: String, text3: String) -> Bool {
        if text1 != kPlaceholder || text1 != "" || text2 != kPlaceholder || text2 != "" || text3 != kPlaceholder || text3 != "" {
            return true
        }
        return false
    }
        
    func saveSensation(text1: String, text2: String, text3: String) {
        dataModel.setFirstFinalExplanation(firstFinalExplanation: text1)
        dataModel.setSecondFinalExplanation(secondFinalExplanation: text2)
        dataModel.setThirdFinalExplanation(thirdFinalExplanation: text3)
    }
}
