//
//  IntensityAnalysisViewModel.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Foundation

class IntensityAnalysisViewModel {
    
    let kChosenWordText = "Palavra escolhida"
    
    var firstChosenWord: String?
    var secondChosenWord: String?
    var thirdChosenWord: String?
    var sliderValueOne: Float?
    var sliderValueTwo: Float?
    var sliderValueThree: Float?
    
    
    func setFirstChosenWord() -> String {
        let word = "\(kChosenWordText) \(firstChosenWord ?? "[1]")"
        return word
    }
    
    func setSecondChosenWord() -> String {
        let word = "\(kChosenWordText) \(secondChosenWord ?? "[1]")"
        return word
    }
    
    func setThirdChosenWord() ->  String {
        let word = "\(kChosenWordText) \(thirdChosenWord ?? "[1]")"
        return word
    }
    
    func setSliderValueOne(value: Float) {
        sliderValueOne = value
    }
    
    func setSliderValueTwo(value: Float) {
        sliderValueTwo = value
    }
    
    func setSliderValueThree(value: Float) {
        sliderValueThree = value
    }
}
