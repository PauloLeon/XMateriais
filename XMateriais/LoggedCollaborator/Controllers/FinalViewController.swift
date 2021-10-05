//
//  FinalViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import Firebase
import FirebaseDatabase
import NVActivityIndicatorView
import UIKit

class FinalViewController: UIViewController, NVActivityIndicatorViewable {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var firstWordTextLabel: UILabel!
    @IBOutlet weak var secondWordTextLabel: UILabel!
    @IBOutlet weak var thirdWordTextLabel: UILabel!
    @IBOutlet weak var FirstWordTextView: UITextView!
    @IBOutlet weak var secondWordTextView: UITextView!
    @IBOutlet weak var thirdWordTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kPlaceholder = "Informe a descrição"
    let viewModel: FinalViewModel = FinalViewModel()
    var ref: DatabaseReference?
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatabase()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        resetSensations()
    }
    
    // MARK: Private Functions
    
    private func setupDatabase() {
        ref = Database.database().reference()
    }
    
    private func setupView() {
        RoundedHelper.roundContinueButton(button: continueButton)
        if let firstWord = viewModel.firstChosenWord, let secondWord = viewModel.secondChosenWord,
            let thirdWord = viewModel.thirdChosenWord {
            firstWordTextLabel.attributedText =  viewModel.setAttributedText(choseWord: firstWord)
            secondWordTextLabel.attributedText = viewModel.setAttributedText(choseWord: secondWord)
            thirdWordTextLabel.attributedText = viewModel.setAttributedText(choseWord: thirdWord)
        }
        setTextView()
        renameNavigationBackButton()
    }
    
    private func setTextView() {
        FirstWordTextView.delegate = self
        secondWordTextView.delegate = self
        thirdWordTextView.delegate = self
        FirstWordTextView.text = kPlaceholder
        FirstWordTextView.textColor = UIColor.lightGray
        secondWordTextView.text = kPlaceholder
        secondWordTextView.textColor = UIColor.lightGray
        thirdWordTextView.text = kPlaceholder
        thirdWordTextView.textColor = UIColor.lightGray
    }
    
    private func resetSensations() {
        viewModel.resetAllSensations()
        FirstWordTextView.text = kPlaceholder
        secondWordTextView.text = kPlaceholder
        thirdWordTextView.text = kPlaceholder
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func validTextView() -> Bool {
        return viewModel.validForm(text1: FirstWordTextView.text ?? "", text2: secondWordTextView.text ?? "", text3: thirdWordTextView.text ?? "")
    }
    
    private func saveFinalForm() {
        startAnimating()
        let userID : String = (Auth.auth().currentUser?.uid)!
        let data = viewModel.getRegisterModelData()
        self.ref!.child("users/\(userID)/analysis").childByAutoId().setValue(data) { (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
            self.createAlert(title: "Não conseguimos finalizar", message: "por favor, tente novamente")
          } else {
            print("Data saved successfully!")
            self.createAlert(title: "Análise Gravada com sucesso", message: "ok")
            self.navigationController?.popToRootViewController(animated: true)
          }
            self.stopAnimating()
        }
    }
    
    // MARK: IBAction's
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if validTextView() {
            viewModel.saveSensation(text1: FirstWordTextView.text ?? "", text2: secondWordTextView.text ?? "", text3: thirdWordTextView.text ?? "")
            saveFinalForm()
        } else {
            createAlert(title: "Por favor preencha os campos", message: "tente novamente")
        }
    }
}

extension FinalViewController: UITextViewDelegate {
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
