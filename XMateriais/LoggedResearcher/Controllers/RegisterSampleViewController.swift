//
//  RegisterSampleViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RegisterSampleViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionMaterialTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variables

    let kSegue = "sampleSucessSegue"
    let kPlaceholder = "Informe a descrição"
    var viewModel: RegisterSampleViewModel = RegisterSampleViewModel()

    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? RegisterSampleSuccessViewController {
                nextViewController.code = viewModel.code
            }
        }
    }

    // MARK: Private Functions
    
    private func setupView() {
        nameTextField.delegate = self
        descriptionMaterialTextView.delegate = self
        descriptionMaterialTextView.text = kPlaceholder
        descriptionMaterialTextView.textColor = UIColor.lightGray
        RoundedHelper.roundContinueButton(button: continueButton)
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setMaterial() {
        viewModel.setNameMaterial(name: nameTextField?.text ?? "")
        viewModel.setDescriptionMaterial(desc: descriptionMaterialTextView.text)
    }
    
    // MARK: IBActions's
    @IBAction func continueDidPressed(_ sender: Any) {
        setMaterial()
        viewModel.saveMaterial()
        self.performSegue(withIdentifier: kSegue, sender: self)
    }
}

extension RegisterSampleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension RegisterSampleViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = kPlaceholder
            textView.textColor = UIColor.lightGray
        }
    }
}
