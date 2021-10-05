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
    let kPlaceholder = "Informe a descrição"
    
    var firstChosenWord: String?
    var secondChosenWord: String?
    var dataModel: RegisterDataModel = RegisterDataModel()
    
    // MARK: Init Functions
    
    init() {
        firstChosenWord = ""
        secondChosenWord = ""
        dataModel = RegisterDataModel()
    }
    
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
    
    func resetAllSensations() {
        firstChosenWord = ""
        secondChosenWord = ""
    }
    
    func validForm(text1: String, text2: String) -> Bool {
        if text1 != kPlaceholder && text1 != "" && text2 != kPlaceholder && text2 != "" {
            return true
        }
        return false
    }
        
    func saveSensation(text1: String, text2: String) {
        dataModel.setfirstChosenWordExplanation(firstChosenWordExplanation: text1)
        dataModel.setSecondChosenWordExplanation(secondChosenWordExplanation: text2)
    }
}
