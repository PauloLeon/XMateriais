//
//  SensationAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

enum RadioGroup {
    case RadioOne, RadioTwo, RadioThree, RadioFour, RadioFive
}

class SensationAnalysisViewController: UIViewController {

    // MARK: IBOutlet's

    @IBOutlet weak var sensationOneView: UIView!
    @IBOutlet weak var sensationOneZeroButton: UIButton!
    @IBOutlet weak var sensationOneOneButton: UIButton!
    @IBOutlet weak var sensationOneTwoButton: UIButton!
    @IBOutlet weak var sensationOneThreeButton: UIButton!
    @IBOutlet weak var sensationOneMinusOneButton: UIButton!
    @IBOutlet weak var sensationOneMinusTwoButton: UIButton!
    @IBOutlet weak var sensationOneMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationTwoView: UIView!
    @IBOutlet weak var sensationTwoZeroButton: UIButton!
    @IBOutlet weak var sensationTwoOneButton: UIButton!
    @IBOutlet weak var sensationTwoTwoButton: UIButton!
    @IBOutlet weak var sensationTwoThreeButton: UIButton!
    @IBOutlet weak var sensationTwoMinusOneButton: UIButton!
    @IBOutlet weak var sensationTwoMinusTwoButton: UIButton!
    @IBOutlet weak var sensationTwoMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationThreeView: UIView!
    @IBOutlet weak var sensationThreeZeroButton: UIButton!
    @IBOutlet weak var sensationThreeOneButton: UIButton!
    @IBOutlet weak var sensationThreeTwoButton: UIButton!
    @IBOutlet weak var sensationThreeThreeButton: UIButton!
    @IBOutlet weak var sensationThreeMinusOneButton: UIButton!
    @IBOutlet weak var sensationThreeMinusTwoButton: UIButton!
    @IBOutlet weak var sensationThreeMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationFourView: UIView!
    @IBOutlet weak var sensationFourZeroButton: UIButton!
    @IBOutlet weak var sensationFourOneButton: UIButton!
    @IBOutlet weak var sensationFourTwoButton: UIButton!
    @IBOutlet weak var sensationFourThreeButton: UIButton!
    @IBOutlet weak var sensationFourMinusOneButton: UIButton!
    @IBOutlet weak var ssensationFourMinusTwoButton: UIButton!
    @IBOutlet weak var sensationFourMinusThreeButton: UIButton!
    
    @IBOutlet weak var sensationFiveView: UIView!
    @IBOutlet weak var sensationFiveZeroButton: UIButton!
    @IBOutlet weak var sensationFiveOneButton: UIButton!
    @IBOutlet weak var sensationFiveTwoButton: UIButton!
    @IBOutlet weak var sensationFiveThreeButton: UIButton!
    @IBOutlet weak var sensationFiveMinusOneButton: UIButton!
    @IBOutlet weak var sensationFiveMinusTwoButton: UIButton!
    @IBOutlet weak var sensationFiveMinusThreeButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        continueButton.layer.cornerRadius = kTwo
        renameNavigationBackButton()
        roundedButtons()
        roundedView()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func roundedView() {
        RoundedHelper.roundView(view: sensationOneView)
        RoundedHelper.roundView(view: sensationTwoView)
        RoundedHelper.roundView(view: sensationThreeView)
        RoundedHelper.roundView(view: sensationFourView)
        RoundedHelper.roundView(view: sensationFiveView)
    }
    
    private func roundedButtons() {
        RoundedHelper.roundButtons(button: sensationOneZeroButton)
        RoundedHelper.roundButtons(button: sensationOneOneButton)
        RoundedHelper.roundButtons(button: sensationOneTwoButton)
        RoundedHelper.roundButtons(button: sensationOneThreeButton)
        RoundedHelper.roundButtons(button: sensationOneMinusOneButton)
        RoundedHelper.roundButtons(button: sensationOneMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationOneMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationTwoZeroButton)
        RoundedHelper.roundButtons(button: sensationTwoOneButton)
        RoundedHelper.roundButtons(button: sensationTwoTwoButton)
        RoundedHelper.roundButtons(button: sensationTwoThreeButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusOneButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationTwoMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationThreeZeroButton)
        RoundedHelper.roundButtons(button: sensationThreeOneButton)
        RoundedHelper.roundButtons(button: sensationThreeTwoButton)
        RoundedHelper.roundButtons(button: sensationThreeThreeButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusOneButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationThreeMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationFourZeroButton)
        RoundedHelper.roundButtons(button: sensationFourOneButton)
        RoundedHelper.roundButtons(button: sensationFourTwoButton)
        RoundedHelper.roundButtons(button: sensationFourThreeButton)
        RoundedHelper.roundButtons(button: sensationFourMinusOneButton)
        RoundedHelper.roundButtons(button: ssensationFourMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationFourMinusThreeButton)
        
        RoundedHelper.roundButtons(button: sensationFiveZeroButton)
        RoundedHelper.roundButtons(button: sensationFiveOneButton)
        RoundedHelper.roundButtons(button: sensationFiveTwoButton)
        RoundedHelper.roundButtons(button: sensationFiveThreeButton)
        RoundedHelper.roundButtons(button: sensationFiveMinusOneButton)
        RoundedHelper.roundButtons(button: sensationFiveMinusTwoButton)
        RoundedHelper.roundButtons(button: sensationFiveMinusThreeButton)
    }
    
    private func selectButton(button: UIButton) {
        button.backgroundColor = UIColor.getPrimaryColor()
    }
    
    private func deselectButton(button: UIButton) {
        button.backgroundColor = UIColor.getDeselectRadioButtonColor()
    }
    
    private func deselectGroup(type: RadioGroup) {
        switch type {
        case .RadioOne:
            deselectButton(button: sensationOneZeroButton)
            deselectButton(button: sensationOneOneButton)
            deselectButton(button: sensationOneTwoButton)
            deselectButton(button: sensationOneThreeButton)
            deselectButton(button: sensationOneMinusOneButton)
            deselectButton(button: sensationOneMinusTwoButton)
            deselectButton(button: sensationOneMinusThreeButton)
        case .RadioTwo:
            deselectButton(button: sensationTwoZeroButton)
            deselectButton(button: sensationTwoOneButton)
            deselectButton(button: sensationTwoTwoButton)
            deselectButton(button: sensationTwoThreeButton)
            deselectButton(button: sensationTwoMinusOneButton)
            deselectButton(button: sensationTwoMinusTwoButton)
            deselectButton(button: sensationTwoMinusThreeButton)
        case .RadioThree:
            deselectButton(button: sensationThreeZeroButton)
            deselectButton(button: sensationThreeOneButton)
            deselectButton(button: sensationThreeTwoButton)
            deselectButton(button: sensationThreeThreeButton)
            deselectButton(button: sensationThreeMinusOneButton)
            deselectButton(button: sensationThreeMinusTwoButton)
            deselectButton(button: sensationThreeMinusThreeButton)
        case .RadioFour:
            deselectButton(button: sensationFourZeroButton)
            deselectButton(button: sensationFourOneButton)
            deselectButton(button: sensationFourTwoButton)
            deselectButton(button: sensationFourThreeButton)
            deselectButton(button: sensationFourMinusOneButton)
            deselectButton(button: ssensationFourMinusTwoButton)
            deselectButton(button: sensationFourMinusThreeButton)
        case .RadioFive:
            deselectButton(button: sensationFiveZeroButton)
            deselectButton(button: sensationFiveOneButton)
            deselectButton(button: sensationFiveTwoButton)
            deselectButton(button: sensationFiveThreeButton)
            deselectButton(button: sensationFiveMinusOneButton)
            deselectButton(button: sensationFiveMinusTwoButton)
            deselectButton(button: sensationFiveMinusThreeButton)
        }
    }
    
    // MARK: IBAction's
    
    @IBAction func sensationOneZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneZeroButton)
    }
    
    @IBAction func sensationOneOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneOneButton)
    }

    @IBAction func sensationOneTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneTwoButton)
    }
    
    @IBAction func sensationOneThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneThreeButton)
    }
    
    @IBAction func sensationOneMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusOneButton)
    }
    
    @IBAction func sensationOneMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusTwoButton)
    }
    
    @IBAction func sensationOneMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusThreeButton)
    }
    
    @IBAction func sensationTwoZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoZeroButton)
    }
    
    @IBAction func sensationTwoOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoOneButton)
    }
    
    @IBAction func sensationTwoTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoTwoButton)
    }
    
    @IBAction func sensationTwoThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoThreeButton)
    }
    
    @IBAction func sensationTwoMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusOneButton)
    }
    
    @IBAction func sensationTwoMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusTwoButton)
    }
    
    @IBAction func sensationTwoMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusThreeButton)
    }
    

    @IBAction func sensationThreeZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeZeroButton)
    }
    
    @IBAction func sensationThreeOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeOneButton)
    }
    
    @IBAction func sensationThreeTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeTwoButton)
    }
    
    @IBAction func sensationThreeThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeThreeButton)
    }
    
    @IBAction func sensationThreeMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusOneButton)
    }
    
    @IBAction func sensationThreeMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusTwoButton)
    }
    
    @IBAction func sensationThreeMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusThreeButton)
    }
    
    @IBAction func sensationFourZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourZeroButton)
    }
    
    @IBAction func sensationFourOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourOneButton)
    }
    
    @IBAction func sensationFourTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourTwoButton)
    }
    
    @IBAction func sensationFourThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourThreeButton)
    }
    
    @IBAction func sensationFourMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourMinusOneButton)
    }
    
    @IBAction func sensationFourMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: ssensationFourMinusTwoButton)
    }
    
    @IBAction func sensationFourMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourMinusThreeButton)
    }

    @IBAction func sensationFiveZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveZeroButton)
    }
    @IBAction func ssensationFiveOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveOneButton)
    }
    
    @IBAction func sensationFiveTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveTwoButton)
    }
    
    @IBAction func sensationFiveThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveThreeButton)
    }
    
    @IBAction func sensationFiveMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveMinusOneButton)
    }
    
    @IBAction func sensationFiveMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveMinusTwoButton)
    }
    
    @IBAction func sensationFiveMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFive)
        selectButton(button: sensationFiveMinusThreeButton)
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {}
}
