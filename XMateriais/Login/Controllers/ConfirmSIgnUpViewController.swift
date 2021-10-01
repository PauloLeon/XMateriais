//
//  ConfirmSIgnUpViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie

class ConfirmSIgnUpViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var animationLottie: AnimationView!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var errorCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTextFieldDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        setupLottie()
    }
    
    // MARK: Private Functions

    private func setupUI() {
        errorCodeLabel.isHidden = true
        RoundedHelper.roundContinueButton(button: continueButton)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupLottie() {
        animationLottie.contentMode = .scaleAspectFit
        animationLottie.loopMode = .loop
        animationLottie.animationSpeed = 0.5
        animationLottie.play()
    }
    
    private func setTextFieldDelegate() {
        codeTextField.delegate = self
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }

    // MARK: IBActions's

    @IBAction func retryButtonDidPressed(_ sender: UIButton) {
        createAlert(title: "Fluxo não habilitado", message: "tente mais tarde")
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        
    }
}

extension ConfirmSIgnUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
