//
//  FirstTutorialViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 21/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class FirstTutorialViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var textOneLabel: UILabel!
    @IBOutlet weak var textTwoLabel: UILabel!
    @IBOutlet weak var roundedOneView: UIView!
    @IBOutlet weak var roundedTwoView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: Variable's
    
    let kOne: CGFloat  = 1.0
    let kAlpha6: CGFloat  = 0.6
    let kTwo: CGFloat = 2.0
    let ktext01 = "Olá, que bom ter você aqui!"
    let ktext02 = "Este é o X-Materiais"
    let ktext03 = "Teste agora"
    let ktext04 = "sua experiência com materiais"
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        roundedOneView.layer.cornerRadius = kTwo
        roundedTwoView.layer.cornerRadius = kTwo
        backButton.isHidden = true
    }
    
    private func updateView(isHidden: Bool) {
        if isHidden {
            backButton.isHidden = false
            roundedOneView.alpha = kAlpha6
            roundedTwoView.alpha = kOne
            textOneLabel.text = ktext03
            textTwoLabel.text = ktext04
        } else {
            backButton.isHidden = true
            roundedOneView.alpha = kOne
            roundedTwoView.alpha = kAlpha6
            textOneLabel.text = ktext01
            textTwoLabel.text = ktext02
        }
    }
    
    // MARK: IBActions's
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        updateView(isHidden: backButton.isHidden)
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if backButton.isHidden {
            updateView(isHidden: backButton.isHidden)
        } else {
            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}
