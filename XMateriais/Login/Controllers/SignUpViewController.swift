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
    
    let kThree: CGFloat = 3.0
    let kBorderWidth: CGFloat = 1.0
    var signUpType: Int?
    let kCollaboratorType: Int = 0
    let kResearcherType: Int = 1

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
        collaboratorButtonNormalState()
        researcherButtonNormalState()
        continueButtonState(isDisable: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func collaboratorButtonNormalState() {
        RoundedHelper.roundDisableContinueButton(button: collaboratorButton)
    }
    
    private func researcherButtonNormalState() {
        RoundedHelper.roundDisableContinueButton(button: researcherButton)
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
            RoundedHelper.roundDisableContinueButton(button: continueButton, titleColor: UIColor.getDisableTextColor())
        } else {
            continueButton.isEnabled = true
            RoundedHelper.roundContinueButton(button: continueButton)
        }
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
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
        switch signUpType {
        case kCollaboratorType:
            self.performSegue(withIdentifier: "collaboratorSegue", sender: self)
        case kResearcherType:
            self.performSegue(withIdentifier: "researcherSegue", sender: self)
        default:
            return
        }
    }
}
