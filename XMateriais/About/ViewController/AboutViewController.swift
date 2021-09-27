//
//  AboutViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
