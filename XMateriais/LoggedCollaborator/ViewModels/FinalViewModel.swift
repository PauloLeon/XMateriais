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
    
    let kPlaceholder = "Informe a descrição"
    
    var dataModel: RegisterDataModel = RegisterDataModel()
    
    // MARK: Init Functions
    
    init() {
        dataModel = RegisterDataModel()
    }
    
    // MARK: Public Functions
    
    func validForm(text1: String, text2: String, text3: String) -> Bool {
        if text1 != kPlaceholder && text1 != "" && text2 != kPlaceholder && text2 != "" && text3 != kPlaceholder && text3 != "" {
            return true
        }
        return false
    }
        
    func saveSensation(text1: String, text2: String, text3: String) {
        dataModel.setFirstFinalExplanation(firstFinalExplanation: text1)
        dataModel.setSecondFinalExplanation(secondFinalExplanation: text2)
        dataModel.setThirdFinalExplanation(thirdFinalExplanation: text3)
    }
    
    func getRegisterModelData() -> [String: Any] {
        return dataModel.getRegisterData()
    }
}
