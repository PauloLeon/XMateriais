//
//  RegistrationResearcherViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class RegistrationResearcherViewController: UIViewController {
    
    // MARK: IBOutlet's
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var schoolingTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var institutionTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    
    // MARK: Variable's
    
    let kTwo: CGFloat = 2.0
    let kBorderWidth: CGFloat = 1.0
    let pickerGenderType = ["Masculino", "Feminino", "Homem transgênero", "Mulher transgênero", "Homem transexual", "Mulher transexual", "Cisgênero", "Prefiro não responder", "Outros"]
    let pickerSchoolingType = ["Ensino Fundamental", "Ensino médio", "Ensino Superior (Graduação)", "Superior (Pós-graduação)", "Mestrado", "Doutorado", "Pós-Doutorado"]
    
    var pickerViewGender = UIPickerView()
    var pickerViewSchooling = UIPickerView()
    var datePickerView: UIDatePicker = UIDatePicker()
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        setupTextFieldDelegate()
        setGenderType()
        setSchoolingType()
        setDateType()
    }
    
    private func setGenderType() {
        pickerViewGender.delegate = self
        genderTextField.inputView = pickerViewGender
    }
    
    private func setSchoolingType() {
        pickerViewSchooling.delegate = self
        schoolingTextField.inputView = pickerViewSchooling
    }
    
    private func setDateType(){
        datePickerView.datePickerMode = .date
        datePickerView.minimumDate = Date()
        datePickerView.locale = Locale(identifier: "pt_BR")
        birthdayTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RegistrationCollaboratorViewController.handelDatePicker), for: UIControl.Event.valueChanged)
    }
    
    private func setupTextFieldDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        birthdayTextField.delegate = self
        genderTextField.delegate = self
        schoolingTextField.delegate = self
        jobTextField.delegate = self
        institutionTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: IBActions's
    @IBAction func continueButtonDidPressed(_ sender: UIButton) {
    }
}

extension RegistrationResearcherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
