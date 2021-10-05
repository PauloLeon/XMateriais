//
//  RegisterDataModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class RegisterDataModel {
    
    // MARK: Variable's
    
    var sampleCode: String?
    var sensationArray: [Int]?
    var visualArray: [Int]?
    var wordListOne: [String]?
    var intensityArray: [Float]?
    var wordListTwo: [String]?
    var firstChosenWordExplanation: String?
    var secondChosenWordExplanation: String?
    var firstFinalExplanation: String?
    var secondFinalExplanation: String?
    var thirdFinalExplanation: String?
    
    // MARK: Init's
    
    init() {
        self.sampleCode = ""
        self.sensationArray = []
        self.visualArray = []
        self.wordListOne = []
        self.intensityArray = []
        self.wordListTwo = []
        self.firstChosenWordExplanation = ""
        self.secondChosenWordExplanation = ""
        self.firstFinalExplanation = ""
        self.secondFinalExplanation = ""
        self.thirdFinalExplanation = ""
    }
    
    init(sampleCode: String?, sensationArray: [Int]?, visualArray: [Int]?, wordListOne: [String]?,  intensityArray: [Float]?, wordListTwo: [String]?, firstChosenWordExplanation: String?, secondChosenWordExplanation: String?, firstFinalExplanation: String?, secondFinalExplanation: String?, thirdFinalExplanation: String?) {
        self.sampleCode = sampleCode
        self.sensationArray = sensationArray
        self.visualArray = visualArray
        self.wordListOne = wordListOne
        self.intensityArray = intensityArray
        self.wordListTwo = wordListTwo
        self.firstChosenWordExplanation = firstChosenWordExplanation
        self.secondChosenWordExplanation = secondChosenWordExplanation
        self.firstFinalExplanation = firstFinalExplanation
        self.secondFinalExplanation = secondFinalExplanation
        self.thirdFinalExplanation = thirdFinalExplanation
    }
    
    // MARK: Public Functions
    
    
    func setSampleCode(sampleCode: String) {
        self.sampleCode = sampleCode
    }
    
    func setSensationArray(sensationArray: [Int]) {
        self.sensationArray = sensationArray
    }
    
    func setVisualArray(visualArray: [Int]) {
        self.visualArray = visualArray
    }
    
    func setWorldList(wordListOne: [String]) {
        self.wordListOne = wordListOne
    }
    
    func setIntensityArray(intensityArray: [Float]) {
        self.intensityArray = intensityArray
    }
    
    func getWordListOne() -> [String] {
        return wordListOne ?? []
    }
    
    func setWorldListTwo(wordListTwo: [String]) {
        self.wordListTwo = wordListTwo
    }
    
    func getWordListTwo() -> [String] {
        return wordListTwo ?? []
    }
    
    func setfirstChosenWordExplanation(firstChosenWordExplanation: String) {
        self.firstChosenWordExplanation = firstChosenWordExplanation
    }
    
    func setSecondChosenWordExplanation(secondChosenWordExplanation: String) {
        self.secondChosenWordExplanation = secondChosenWordExplanation
    }
    
    func setFirstFinalExplanation(firstFinalExplanation: String) {
        self.firstFinalExplanation = firstFinalExplanation
    }
    
    func setSecondFinalExplanation(secondFinalExplanation: String) {
        self.secondFinalExplanation = secondFinalExplanation
    }
    
    func setThirdFinalExplanation(thirdFinalExplanation: String) {
        self.thirdFinalExplanation = thirdFinalExplanation
    }
}
