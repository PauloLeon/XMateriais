//
//  InterpretativeAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 30/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class InterpretativeAnalysisViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var firstWordTextLabel: UILabel!
    @IBOutlet weak var secondWordTextLabel: UILabel!
    @IBOutlet weak var FirstWordTextView: UITextView!
    @IBOutlet weak var secondWordTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kSegue: String = "segueFinal"
    let kPlaceholder = "Informe a descrição"
    let viewModel: InterpretativeAnalysisViewModel = InterpretativeAnalysisViewModel()
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBorder()
        resetSensations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? FinalViewController {
                viewModel.saveSensation(text1: FirstWordTextView.text ?? "", text2: secondWordTextView.text ?? "")
                nextViewController.viewModel.dataModel = viewModel.dataModel
            }
        }
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        viewModel.setWords()
        RoundedHelper.roundContinueButton(button: continueButton)
        if let firstWord = viewModel.firstChosenWord, let secondWord = viewModel.secondChosenWord {
            firstWordTextLabel.attributedText =  viewModel.setAttributedText(choseWord: firstWord)
            secondWordTextLabel.attributedText = viewModel.setAttributedText(choseWord: secondWord)
        }
        setTextView()
        renameNavigationBackButton()
    }
    
    private func setTextView() {
        FirstWordTextView.delegate = self
        secondWordTextView.delegate = self
        FirstWordTextView.text = kPlaceholder
        FirstWordTextView.textColor = UIColor.lightGray
        secondWordTextView.text = kPlaceholder
        secondWordTextView.textColor = UIColor.lightGray
    }
    
    private func resetSensations() {
        viewModel.resetAllSensations()
        FirstWordTextView.text = kPlaceholder
        secondWordTextView.text = kPlaceholder
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
        return viewModel.validForm(text1: FirstWordTextView.text ?? "", text2: secondWordTextView.text ?? "")
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if validTextView() {
            performSegue(withIdentifier: kSegue, sender: nil)
        } else {
            createAlert(title: "Por favor preencha os campos", message: "tente novamente")
        }
    }
}

extension InterpretativeAnalysisViewController: UITextViewDelegate {
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
