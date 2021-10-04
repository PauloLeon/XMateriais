//
//  IntensityAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class IntensityAnalysisViewModel {
    
    // MARK: Variable's
    
    let kZero: Int = 0
    let kOne: Int = 1
    let kTwo: Int = 2
    let kZeroFloat: Float = 0.0
    let kChosenWordText = "Palavra escolhida"
    let kSegue = "segueInterpretative"
    
    var firstChosenWord: String?
    var secondChosenWord: String?
    var thirdChosenWord: String?
    var sliderValueOne: Float?
    var sliderValueTwo: Float?
    var sliderValueThree: Float?
    var sliderArray: [Float]?
    var dataModel: RegisterDataModel?
    
    
    // MARK: Init Functions
    
    init() {
        sliderArray = [kZeroFloat, kZeroFloat, kZeroFloat]
    }
    
    // MARK: Public Functions
    
    func setFirstChosenWord() -> String {
        let word = "\(kChosenWordText) \(firstChosenWord ?? "[1]")"
        return word
    }
    
    func setSecondChosenWord() -> String {
        let word = "\(kChosenWordText) \(secondChosenWord ?? "[2]")"
        return word
    }
    
    func setThirdChosenWord() ->  String {
        let word = "\(kChosenWordText) \(thirdChosenWord ?? "[3]")"
        return word
    }
    
    func setSliderValueOne(value: Float) {
        sliderValueOne = value
        sliderArray?[kZero] = value
    }
    
    func setSliderValueTwo(value: Float) {
        sliderValueTwo = value
        sliderArray?[kOne] = value
    }
    
    func setSliderValueThree(value: Float) {
        sliderValueThree = value
        sliderArray?[kTwo] = value
    }
    
    func saveSensation() {
        dataModel?.setIntensityArray(intensityArray: sliderArray ?? [])
    }
}
