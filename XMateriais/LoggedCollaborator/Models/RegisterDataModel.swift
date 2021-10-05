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
    
    // MARK: Init's

    
    init() {
        self.sampleCode = ""
        self.sensationArray = []
        self.visualArray = []
        self.wordListOne = []
        self.intensityArray = []
    }
    
    init(sampleCode: String?, sensationArray: [Int]?, visualArray: [Int]?, wordListOne: [String]?,  intensityArray: [Float]?) {
        self.sampleCode = sampleCode
        self.sensationArray = sensationArray
        self.visualArray = visualArray
        self.wordListOne = wordListOne
        self.intensityArray = intensityArray
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
}
