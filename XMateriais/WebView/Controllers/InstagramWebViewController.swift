//
//  AboutViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 26/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit
import WebKit

class InstagramWebViewController: UIViewController, WKNavigationDelegate {
    
    // MARK: Variable's

    let kInstaURL: String = "https://www.instagram.com/xmat.eriais/?hl=pt-br"
    var webview: WKWebView?
    
    // MARK: Override Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupWebView()
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupWebView() {
        webview = WKWebView()
        webview?.navigationDelegate = self
        view = webview
        let url = URL(string: kInstaURL)!
        webview?.load(URLRequest(url: url))
        webview?.allowsBackForwardNavigationGestures = true
    }
}
