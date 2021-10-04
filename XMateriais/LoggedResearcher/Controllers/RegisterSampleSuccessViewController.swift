//
//  RegisterSampleSuccessViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 28/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie

class RegisterSampleSuccessViewController: UIViewController {
    
    // MARK: IBOutlet's

    @IBOutlet weak var lottieAnimation: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kTitle1 = "Amostra"
    let kTitle2 = "Cadastrada"
    let kDesc = "Sua amostra foi cadastrada com sucesso! O seu código da amostra é:"

    var code: String?
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Private Functions
    
    private func setupView() {
        setupLottie()
        RoundedHelper.roundContinueButton(button: continueButton)
        renameNavigationBackButton()
        
        guard let sampleCode = code else { return }
        titleLabel.text = "\(kTitle1) \(sampleCode) \(kTitle2)"
        descriptionLabel.text = "\(kDesc) \(sampleCode)"
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupLottie() {
        lottieAnimation.contentMode = .scaleAspectFit
        lottieAnimation.loopMode = .loop
        lottieAnimation.animationSpeed = 0.5
        lottieAnimation.play()
    }
    
    // MARK: IBActions's
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
