//
//  IntensityAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class IntensityAnalysisViewController: UIViewController {
    
    // MARK: IBOutlet's
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstChosenWordLabel: UILabel!
    @IBOutlet weak var secondChosenWordLabel: UILabel!
    @IBOutlet weak var thirdChosenWordLabel: UILabel!
    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var thirdSlider: UISlider!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kSegue = "segueInterpretativeWords"
    let viewModel: IntensityAnalysisViewModel  = IntensityAnalysisViewModel()
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetSensations()
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == kSegue {
             if let nextViewController = segue.destination as? InterpretativeWordsAnalysisViewController {
                viewModel.saveSensation()
                nextViewController.viewModel?.dataModel = viewModel.dataModel ?? RegisterDataModel()
             }
         }
     }
    
    // MARK: Private Functions
    
    private func setupView() {
        viewModel.setWords()
        setupChosenWord()
        renameNavigationBackButton()
        removeNavigationBorder()
        roundedView()
        RoundedHelper.roundContinueButton(button: continueButton)
    }
    
    private func resetSensations() {
        viewModel.resetSensations()
        resetSlider()
    }
    
    private func resetSlider() {
        firstSlider.value = viewModel.kSliderDefaultValue
        secondSlider.value = viewModel.kSliderDefaultValue
        thirdSlider.value = viewModel.kSliderDefaultValue
    }
    
    private func roundedView() {
        RoundedHelper.roundView(view: firstView)
        RoundedHelper.roundView(view: secondView)
        RoundedHelper.roundView(view: thirdView)
    }
    
    private func setupChosenWord() {
        firstChosenWordLabel.text = viewModel.setFirstChosenWord()
        secondChosenWordLabel.text = viewModel.setSecondChosenWord()
        thirdChosenWordLabel.text = viewModel.setThirdChosenWord()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    @IBAction func firstSliderDidChange(_ sender: UISlider) {
        viewModel.setSliderValueOne(value: sender.value)
    }
    
    @IBAction func secondSliderDidChange(_ sender: UISlider) {
        viewModel.setSliderValueTwo(value: sender.value)
    }
    
    @IBAction func thirdSliderDidChange(_ sender: UISlider) {
        viewModel.setSliderValueThree(value: sender.value)
    }
    
    @IBAction func continueButtonDidPressed(_ sender: UIButton) {
        if viewModel.validForm() {
            performSegue(withIdentifier: kSegue, sender: nil)
        } else {
            createAlert(title: "Você deve definir ao menos uma reação no slider", message: "tente novamente")
        }
    }
}
