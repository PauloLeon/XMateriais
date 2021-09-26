//
//  SignUpViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var collaboratorButton: UIButton!
    @IBOutlet weak var researcherButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0
    var signUpType: Int?
    let kCollaboratorType: Int = 0
    let kResearcherType: Int = 1

    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        collaboratorButtonNormalState()
        researcherButtonNormalState()
        continueButtonState(isDisable: true)
    }
    
    private func collaboratorButtonNormalState() {
        collaboratorButton.layer.cornerRadius = kTwo
        collaboratorButton.layer.borderWidth = kBorderWidth
        collaboratorButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        collaboratorButton.setTitleColor(UIColor.getGrayColor(), for: .normal)
        collaboratorButton.backgroundColor = UIColor.white
    }
    
    private func researcherButtonNormalState() {
        researcherButton.layer.cornerRadius = kTwo
        researcherButton.layer.borderWidth = kBorderWidth
        researcherButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
        researcherButton.setTitleColor(UIColor.getGrayColor(), for: .normal)
        researcherButton.backgroundColor = UIColor.white
    }
    
    private func collaboratorButtonChosenState() {
        collaboratorButton.setTitleColor(UIColor.getPrimaryColor(), for: .normal)
        collaboratorButton.backgroundColor = UIColor.getSecondaryLightColor()
    }
    
    private func researcherButtonChosenState() {
        researcherButton.setTitleColor(UIColor.getPrimaryColor(), for: .normal)
        researcherButton.backgroundColor = UIColor.getSecondaryLightColor()
    }
    
    private func continueButtonState(isDisable: Bool) {
        if isDisable {
            continueButton.isEnabled = false
            continueButton.layer.cornerRadius = kTwo
            continueButton.layer.borderWidth = kBorderWidth
            continueButton.backgroundColor = UIColor.getDisableColor()
            continueButton.layer.borderColor = UIColor.getDisableBorderColor().cgColor
            continueButton.setTitleColor(UIColor.getDisableTextColor(), for: .disabled)
        } else {
            continueButton.isEnabled = true
            continueButton.layer.cornerRadius = kTwo
            continueButton.layer.borderWidth = kBorderWidth
            continueButton.backgroundColor = UIColor.getPrimaryColor()
            continueButton.layer.borderColor = UIColor.getPrimaryColor().cgColor
            continueButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    // MARK: IBActions's
    
    @IBAction func collaboratorButtonDidPressed(_ sender: Any) {
        collaboratorButtonChosenState()
        researcherButtonNormalState()
        continueButtonState(isDisable: false)
        signUpType = kCollaboratorType
    }
    
    @IBAction func researcherButtonDidPressed(_ sender: Any) {
        researcherButtonChosenState()
        collaboratorButtonNormalState()
        continueButtonState(isDisable: false)
        signUpType = kResearcherType
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {

    }
}
