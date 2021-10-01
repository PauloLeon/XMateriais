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
    
    let kSegue: String = ""
    let viewModel: InterpretativeAnalysisViewModel = InterpretativeAnalysisViewModel()
    
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
        RoundedHelper.roundContinueButton(button: continueButton)
        if let firstWord = viewModel.firstChosenWord, let secondWord = viewModel.secondChosenWord {
            firstWordTextLabel.attributedText =  viewModel.setAttributedText(choseWord: firstWord)
            secondWordTextLabel.attributedText = viewModel.setAttributedText(choseWord: secondWord)
        }
        renameNavigationBackButton()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func removeNavigationBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
       
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        performSegue(withIdentifier: kSegue, sender: nil)
    }
}
