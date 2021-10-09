//
//  EmailViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import Lottie
import MessageUI

class EmailViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var lottieAnimation: AnimationView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variables's

    let kSegue = "segueSuccess"
    let kNameMaterial = "nameMaterial"
    let kCode = "code"
    var material: NSDictionary?
    
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
        sendEmail()
    }
}

extension EmailViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["amandasousamonteiro@usp.br"])
            mail.setSubject("Solicitação de resultado")
            mail.setMessageBody("<p>Olá XMateriais!</p><br>Gostaria de solicitar os resultados para a amostra \(material?[kCode] ?? "")", isHTML: true)

            present(mail, animated: true) { self.performSegue(withIdentifier: self.kSegue, sender: nil) }
        } else {
            createAlert(title: "Erro ao tentar enviar e-mail", message: "tente novamente mais tarde")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
