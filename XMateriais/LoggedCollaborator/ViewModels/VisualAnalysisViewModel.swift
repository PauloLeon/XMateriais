//
//  VisualAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class VisualAnalysisViewModel {
    
    // MARK: Variable's
    
    let kZero: Int = 0
    let kOne: Int = 1
    let kTwo: Int = 2
    let kThree: Int = 3
    let kFour: Int = 4
    let kMinusOne: Int = -1
    let kMinusTwo: Int = -2
    let kMinusThree: Int = -3
    
    var sensationsArray: [Int]?
    
    // MARK: Init Functions
    
    init() {
        sensationsArray = [kZero, kZero, kZero, kZero]
    }
    
    // MARK: Public functions
    
    func updateSensation(value: Int, radioGroup: RadioGroup) {
        switch radioGroup {
        case .RadioOne:
            sensationsArray?[kZero] = value
        case .RadioTwo:
            sensationsArray?[kOne] = value
        case .RadioThree:
            sensationsArray?[kTwo] = value
        case .RadioFour:
            sensationsArray?[kThree] = value
        case .RadioFive:
            sensationsArray?[kFour] = value
        }
    }
    
    func resetSensation(radioGroup: RadioGroup) {
        switch radioGroup {
        case .RadioOne:
            sensationsArray?[kZero] = kZero
        case .RadioTwo:
            sensationsArray?[kOne] = kZero
        case .RadioThree:
            sensationsArray?[kTwo] = kZero
        case .RadioFour:
            sensationsArray?[kThree] = kZero
        case .RadioFive:
            sensationsArray?[kFour] = kZero
        }
    }
}
