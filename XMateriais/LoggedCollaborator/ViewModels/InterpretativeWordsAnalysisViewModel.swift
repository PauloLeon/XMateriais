//
//  InterpretativeWordsAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 05/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class InterpretativeWordsAnalysisViewModel {
    
    // MARK: Variable's
    
    let kZero: Int = 0
    let kOne: Int = 1
    let kTwo: Int = 2
    var wordsList: [String]?
    var switchList: [Bool]?
    var finalList: [String]?
    var dataModel: RegisterDataModel = RegisterDataModel()
    
    // MARK: Init Functions
    
    init() {
        wordsList = ["Agressivo", "Calmo", "Acolhedor", "Indiferente", "Elegante" , "Vulgar" , "Frívolo" , "Sério" , "Futurista" , "Nostálgico" , "Masculino" , "Feminino" , "Comum", "Estranho", "Infantilizado", "Adulto", "Natural", "Artificial", "Artesanal", "Industrializado"]
        switchList = [false, false, false, false, false , false , false , false , false , false , false , false , false, false, false, false, false, false, false, false]
        finalList = []
        dataModel = RegisterDataModel()
    }
    
    // MARK: Public Functions
    
    public func chosenWord(chosenWord: String, chosenSwitch: Bool) {
        guard let wList = wordsList else {
            return
        }
        for (index, word) in wList.enumerated()  {
            if word == chosenWord {
                switchList?[index] = chosenSwitch
            }
        }
    }
    
    public func isMaxChosenSwitch(isSwitchOff: Bool) -> Bool {
        if !isSwitchOff {
            return false
        }
        var count = kZero
        for chosenSwitch in switchList ?? [] {
            if chosenSwitch == true {
                count = count + kOne
            }
        }
        return count > kOne
    }
    
    public func isMaxSwitch() -> Bool {
        var count = kZero
        for chosenSwitch in switchList ?? [] {
            if chosenSwitch == true {
                count = count + kOne
            }
        }
        return count == kTwo
    }
    
    public func saveAnalysisInFinalList() {
        guard let sList = switchList else {
            return
        }
        for (index, chosenSwitch) in sList.enumerated()  {
            if chosenSwitch == true {
                finalList?.append(wordsList?[index] ?? "")
            }
        }
    }
    
    public func resetSensations() {
        switchList = [false, false, false, false, false , false , false , false , false , false , false , false , false, false, false, false, false, false, false, false]
        finalList = []
    }
    
    public func saveAnalysis() {
        saveAnalysisInFinalList()
        dataModel.setWorldListTwo(wordListTwo: finalList ?? [])
    }
}
