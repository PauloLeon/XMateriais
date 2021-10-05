//
//  AffectiveAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class AffectiveAnalysisViewModel {
    
    // MARK: Variable's
    
    var wordsList: [String]?
    var switchList: [Bool]?
    var finalList: [String]?
    var dataModel: RegisterDataModel = RegisterDataModel()
    
    // MARK: Init Functions
    
    init() {
        wordsList = ["Frustação", "Amor", "Tédio", "Diversão", "Desapontamento" , "Surpresa" , "Desconfiança" , "Confiança" , "Confusão" , "Deslumbramento" , "Respeito" , "Rejeição" , "Aversão", "Atração", "Melancolia", "Curiosidade", "Hesitação", "Fascinação", "Dúvida", "Conforto"]
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
        var count = 0
        for chosenSwitch in switchList ?? [] {
            if chosenSwitch == true {
                count = count + 1
            }
        }
        return count > 2
    }
    
    public func isMaxSwitch() -> Bool {
        var count = 0
        for chosenSwitch in switchList ?? [] {
            if chosenSwitch == true {
                count = count + 1
            }
        }
        return count == 3
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
        dataModel.setWorldList(wordListOne: finalList ?? [])
    }
}
