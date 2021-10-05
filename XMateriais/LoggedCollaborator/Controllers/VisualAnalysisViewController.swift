//
//  VisualAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class VisualAnalysisViewController: UIViewController {
    
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
    
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kZero: Int = 0
    let kOne: Int = 1
    let kTwo: Int = 2
    let kThree: Int = 3
    let kMinusOne: Int = -1
    let kMinusTwo: Int = -2
    let kMinusThree: Int = -3
    let kSegue: String = "segueList"
    
    var viewModel: VisualAnalysisViewModel? = VisualAnalysisViewModel()
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        resetSensations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? AffectiveAnalysisViewController {
                viewModel?.saveSensation()
                nextViewController.viewModel?.dataModel = viewModel?.dataModel ?? RegisterDataModel()
            }
        }
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        renameNavigationBackButton()
        removeNavigationBorder()
        roundedButtons()
        roundedView()
        RoundedHelper.roundContinueButton(button: continueButton)
    }
    
    private func resetSensations() {
        viewModel?.resetAllSensations()
        deselectGroup(type: RadioGroup.RadioOne)
        deselectGroup(type: RadioGroup.RadioTwo)
        deselectGroup(type: RadioGroup.RadioThree)
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationOneZeroButton)
        selectButton(button: sensationTwoZeroButton)
        selectButton(button: sensationThreeZeroButton)
        selectButton(button: sensationFourZeroButton)
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
            viewModel?.resetSensation(radioGroup: RadioGroup.RadioOne)
        case .RadioTwo:
            deselectButton(button: sensationTwoZeroButton)
            deselectButton(button: sensationTwoOneButton)
            deselectButton(button: sensationTwoTwoButton)
            deselectButton(button: sensationTwoThreeButton)
            deselectButton(button: sensationTwoMinusOneButton)
            deselectButton(button: sensationTwoMinusTwoButton)
            deselectButton(button: sensationTwoMinusThreeButton)
            viewModel?.resetSensation(radioGroup: RadioGroup.RadioTwo)
        case .RadioThree:
            deselectButton(button: sensationThreeZeroButton)
            deselectButton(button: sensationThreeOneButton)
            deselectButton(button: sensationThreeTwoButton)
            deselectButton(button: sensationThreeThreeButton)
            deselectButton(button: sensationThreeMinusOneButton)
            deselectButton(button: sensationThreeMinusTwoButton)
            deselectButton(button: sensationThreeMinusThreeButton)
            viewModel?.resetSensation(radioGroup: RadioGroup.RadioThree)
        case .RadioFour:
            deselectButton(button: sensationFourZeroButton)
            deselectButton(button: sensationFourOneButton)
            deselectButton(button: sensationFourTwoButton)
            deselectButton(button: sensationFourThreeButton)
            deselectButton(button: sensationFourMinusOneButton)
            deselectButton(button: ssensationFourMinusTwoButton)
            deselectButton(button: sensationFourMinusThreeButton)
            viewModel?.resetSensation(radioGroup: RadioGroup.RadioFour)
        case .RadioFive:
            return
        }
    }
    
    // MARK: IBAction's
    
    @IBAction func sensationOneZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneZeroButton)
        viewModel?.updateSensation(value: kZero, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneOneButton)
        viewModel?.updateSensation(value: kOne, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneTwoButton)
        viewModel?.updateSensation(value: kTwo, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneThreeButton)
        viewModel?.updateSensation(value: kThree, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusOneButton)
        viewModel?.updateSensation(value: kMinusOne, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusTwoButton)
        viewModel?.updateSensation(value: kMinusTwo, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationOneMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioOne)
        selectButton(button: sensationOneMinusThreeButton)
        viewModel?.updateSensation(value: kMinusThree, radioGroup: RadioGroup.RadioOne)
    }
    
    @IBAction func sensationTwoZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoZeroButton)
        viewModel?.updateSensation(value: kZero, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoOneButton)
        viewModel?.updateSensation(value: kOne, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoTwoButton)
        viewModel?.updateSensation(value: kTwo, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoThreeButton)
        viewModel?.updateSensation(value: kThree, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusOneButton)
        viewModel?.updateSensation(value: kMinusOne, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusTwoButton)
        viewModel?.updateSensation(value: kMinusTwo, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationTwoMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioTwo)
        selectButton(button: sensationTwoMinusThreeButton)
        viewModel?.updateSensation(value: kMinusThree, radioGroup: RadioGroup.RadioTwo)
    }
    
    @IBAction func sensationThreeZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeZeroButton)
        viewModel?.updateSensation(value: kZero, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeOneButton)
        viewModel?.updateSensation(value: kOne, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeTwoButton)
        viewModel?.updateSensation(value: kTwo, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeThreeButton)
        viewModel?.updateSensation(value: kThree, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusOneButton)
        viewModel?.updateSensation(value: kMinusOne, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusTwoButton)
        viewModel?.updateSensation(value: kMinusTwo, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationThreeMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioThree)
        selectButton(button: sensationThreeMinusThreeButton)
        viewModel?.updateSensation(value: kMinusThree, radioGroup: RadioGroup.RadioThree)
    }
    
    @IBAction func sensationFourZeroDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourZeroButton)
        viewModel?.updateSensation(value: kZero, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func sensationFourOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourOneButton)
        viewModel?.updateSensation(value: kOne, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func sensationFourTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourTwoButton)
        viewModel?.updateSensation(value: kTwo, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func sensationFourThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourThreeButton)
        viewModel?.updateSensation(value: kThree, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func sensationFourMinusOneDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourMinusOneButton)
        viewModel?.updateSensation(value: kMinusOne, radioGroup: RadioGroup.RadioFour)
    }
    
    
    @IBAction func sensationFourMinusTwoDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: ssensationFourMinusTwoButton)
        viewModel?.updateSensation(value: kMinusTwo, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func sensationFourMinusThreeDidPressed(_ sender: Any) {
        deselectGroup(type: RadioGroup.RadioFour)
        selectButton(button: sensationFourMinusThreeButton)
        viewModel?.updateSensation(value: kMinusThree, radioGroup: RadioGroup.RadioFour)
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if viewModel?.validForm() ?? false {
            performSegue(withIdentifier: kSegue, sender: nil)
        } else {
            createAlert(title: "Você deve escolher ao menos uma reação", message: "tente novamente")
        }
    }
}
