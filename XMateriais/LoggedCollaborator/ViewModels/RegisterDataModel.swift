//
//  RegisterDataModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class RegisterDataModel {
    
    var sensationArray: [Int]?
    var visualArray: [Int]?
    var intensityArray: [Float]?
    
    init() {
        self.sensationArray = []
        self.visualArray = []
        self.intensityArray = []
    }
    
    init(sensationArray: [Int]?, visualArray: [Int]?,  intensityArray: [Float]?) {
        self.sensationArray = sensationArray
        self.visualArray = visualArray
        self.intensityArray = intensityArray
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
