//
//  ConfirmSIgnUpViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class ConfirmSIgnUpViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var errorCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTextFieldDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions

    private func setupUI() {
        errorCodeLabel.isHidden = true
        continueButton.layer.cornerRadius = kTwo
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
