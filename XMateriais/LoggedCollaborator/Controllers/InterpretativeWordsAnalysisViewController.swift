//
//  InterpretativeWordsAnalysisViewController.swift
//  XMateriais
//
//  Created by Paulo Rosa on 05/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

class InterpretativeWordsAnalysisViewController: UIViewController {
    
    // MARK: IBOutlet's
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Variable's
    
    let kReusableIdentifier = "wordCell"
    let kSegue = "segueInterpretative"
    let kCellHeight: CGFloat = 88.0
    
    var viewModel: InterpretativeWordsAnalysisViewModel? = InterpretativeWordsAnalysisViewModel()
    
    
    // MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetSensations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegue {
            if let nextViewController = segue.destination as? InterpretativeAnalysisViewController {
                viewModel?.saveAnalysis()
//                nextViewController.viewModel.dataModel = viewModel?.dataModel ?? RegisterDataModel()
            }
        }
    }
    
    // MARK: Private Functions
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        renameNavigationBackButton()
    }
    
    private func resetSensations() {
        viewModel?.resetSensations()
        tableView.reloadData()
    }
    
    private func renameNavigationBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func continueButtonDidPressed(_ sender: Any) {
        if viewModel?.isMaxSwitch() ?? false {
            performSegue(withIdentifier: kSegue, sender: nil)
        } else {
            createAlert(title: "Você deve escolher 2 palavras", message: "tente novamente")
        }
    }
}

extension InterpretativeWordsAnalysisViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReusableIdentifier, for: indexPath) as! AffectiveAnalysisTableViewCell
        let word = viewModel?.wordsList?[indexPath.row] ?? ""
        let isOn = viewModel?.switchList?[indexPath.row] ?? false
        cell.configCell(word: word, isSwithActive: isOn)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.wordsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight
    }
}

extension InterpretativeWordsAnalysisViewController: AffectiveAnalysisTableViewCellDelegate {
    func didChangeSwitchValue(value: Bool, word: String) {
        if viewModel?.isMaxChosenSwitch(isSwitchOff: value) ?? true {
            createAlert(title: "você deve escolher apenas 2", message: "tente novamente")
            viewModel?.chosenWord(chosenWord: word, chosenSwitch: !value)
            tableView.reloadData()
        } else {
            viewModel?.chosenWord(chosenWord: word, chosenSwitch: value)
        }
    }
}

