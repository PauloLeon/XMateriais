//
//  LoggedCollaboratorViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoggedCollaboratorViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var errorCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: Variable's
    
    let kSegue: String = "sensationSegue"
    let kSegueTutorial: String = "tutorialSegue"
    
    var ref: DatabaseReference?
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        initDataBase()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        setupNameLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? SensationAnalysisViewController {
                nextViewController.viewModel?.dataModel.setSampleCode(sampleCode: codeTextField.text ?? "")
            }
        }
    }
    
    // MARK: Private Functions
    
    private func initDataBase() {
        ref = Database.database().reference()
    }
    
    private func setupView() {
        codeTextField.delegate = self
        errorCodeLabel.isHidden = true
        RoundedHelper.roundContinueButton(button: continueButton)
        RoundedHelper.roundDisableContinueButton(button: logoutButton, titleColor: UIColor.red)
        renameNavigationBackButton()
    }
    
    private func setupNameLabel() {
        let userID : String = (Auth.auth().currentUser?.uid)!
        print("Current user ID is" + userID)
        self.ref!.child("users").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
            let name = (snapshot.value as! NSDictionary)["name"] as! String
            self.helloLabel.text = "Oi! \(name)"
        })
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func logout() {
        do {
            try Auth.auth().signOut()
            Defaults.clearUserData()
            performSegue(withIdentifier: kSegueTutorial, sender: nil)
        } catch {
            createAlert(title: "Não conseguimos deslogar", message: "Tente novamente mais tarde")
        }
    }
    
    // MARK: IBAction's
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if codeTextField.text != nil && codeTextField.text != "" {
            performSegue(withIdentifier: kSegue, sender: nil)
        }
    }
    
    @IBAction func logoutDidPressed(_ sender: Any) {
        logout()
    }
}

extension LoggedCollaboratorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
