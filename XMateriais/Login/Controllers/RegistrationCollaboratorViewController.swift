//
//  RegistrationCollaboratorViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import NVActivityIndicatorView

class RegistrationCollaboratorViewController: UIViewController, NVActivityIndicatorViewable {
    
    // MARK: IBOutlet's
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var schoolingTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var warningPasswordLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    let kSegue: String = "validFormSegue"
    let pickerGenderType = ["Masculino", "Feminino", "Homem transgênero", "Mulher transgênero", "Homem transexual", "Mulher transexual", "Cisgênero", "Prefiro não responder", "Outros"]
    let pickerSchoolingType = ["Ensino Fundamental", "Ensino médio", "Ensino Superior (Graduação)", "Superior (Pós-graduação)", "Mestrado", "Doutorado", "Pós-Doutorado"]
    
    var pickerViewGender = UIPickerView()
    var pickerViewSchooling = UIPickerView()
    var datePickerView: UIDatePicker = UIDatePicker()
    var ref: DatabaseReference?
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? FirstPresentationViewController {
                    nextViewController.type = 0
            }
        }
    }
    
    // MARK: Private Functions

    private func setupView() {
        errorEmailLabel.isHidden = true
        warningPasswordLabel.isHidden = true
        RoundedHelper.roundContinueButton(button: continueButton)
        setupTextFieldDelegate()
        setGenderType()
        setSchoolingType()
        setDateType()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupTextFieldDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        birthdayTextField.delegate = self
        genderTextField.delegate = self
        schoolingTextField.delegate = self
        jobTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
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
        datePickerView.maximumDate = Date()
        datePickerView.locale = Locale(identifier: "pt_BR")
        birthdayTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(RegistrationCollaboratorViewController.handelDatePicker), for: UIControl.Event.valueChanged)
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func isFormValid() -> Bool {
        warningPasswordLabel.isHidden = true
        errorEmailLabel.isHidden = true
        if nameTextField.text!.isEmpty || emailTextField.text!.isEmpty ||  birthdayTextField.text!.isEmpty ||
            genderTextField.text!.isEmpty || schoolingTextField.text!.isEmpty || jobTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty {
            createAlert(title: "Cadastro Incompleto", message: "Preencha todos os campos corretamente")
            return false
        }
        
        if !isValidEmail(testStr: emailTextField.text!) {
            createAlert(title: "Por favor, insira um e-mail válido", message: "tente novamente")
            errorEmailLabel.isHidden = false
            return false
        }
        
        if passwordTextField.text! != confirmPasswordTextField.text! {
            createAlert(title: "Campos de senha estão diferentes", message: "tente novamente")
            return false
        }
        
        if passwordTextField.text!.count < 6 {
            createAlert(title: "Sua senha precisa ter 6 ou mais dígitos", message: "tente novamente")
            warningPasswordLabel.isHidden = false
            return false
        }
        return true
    }
    
    private func setUserData() -> [String : Any] {
        guard let name = nameTextField.text,
            let birthday = birthdayTextField.text,
            let gender = genderTextField.text,
            let schooling = schoolingTextField.text,
            let job = jobTextField.text else {
                return [:]
        }
        let userData = ["type": 0, "name": name , "birthday": birthday, "gender": gender, "schooling": schooling, "job": job] as [String : Any]
        return userData
    }
    
    private func getEmail() -> String {
        guard let email = emailTextField.text else {
                return ""
        }
        return email
    }
    
    private func getPassword() -> String {
        guard let password = passwordTextField.text else {
                return ""
        }
        return password
    }
    
    // MARK: IBActions's
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if isFormValid() {
            startAnimating()
            Auth.auth().createUser(withEmail: getEmail(), password: getPassword()) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.stopAnimating()
                } else {
                    self.ref!.child("users").child(user!.user.uid).setValue(self.setUserData())
                    self.stopAnimating()
                    self.performSegue(withIdentifier: self.kSegue, sender: self)
                }
            }
        } else {
            createAlert(title: "Serviço fora do ar", message: "tente novamente mais tarde")
        }
    }
}

extension RegistrationCollaboratorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
