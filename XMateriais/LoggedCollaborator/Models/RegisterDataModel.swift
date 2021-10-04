//
//  RegisterDataModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class RegisterDataModel {
    
    var sampleCode: String?
    var sensationArray: [Int]?
    var visualArray: [Int]?
    var intensityArray: [Float]?
    
    init() {
        self.sampleCode = ""
        self.sensationArray = []
        self.visualArray = []
        self.intensityArray = []
    }
    
    init(sampleCode: String?, sensationArray: [Int]?, visualArray: [Int]?,  intensityArray: [Float]?) {
        self.sampleCode = sampleCode
        self.sensationArray = sensationArray
        self.visualArray = visualArray
        self.intensityArray = intensityArray
    }
    
    func setSampleCode(sampleCode: String) {
        self.sampleCode = sampleCode
    }
    
    func setSensationArray(sensationArray: [Int]) {
        self.sensationArray = sensationArray
    }
    
    func setVisualArray(visualArray: [Int]) {
        self.visualArray = visualArray
    }
    
    func setIntensityArray(intensityArray: [Float]) {
        self.intensityArray = intensityArray
    }
}
