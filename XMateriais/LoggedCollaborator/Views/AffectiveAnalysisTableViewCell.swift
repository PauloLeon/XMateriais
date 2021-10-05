//
//  AffectiveAnalysisTableViewCell.swift
//  XMateriais
//
//  Created by Paulo Rosa on 04/10/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

protocol AffectiveAnalysisTableViewCellDelegate {
    func didChangeSwitchValue(value: Bool, word: String)
}

class AffectiveAnalysisTableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var chosenSwitch: UISwitch!
    
    var value: Bool =  false
    var delegate: AffectiveAnalysisTableViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configCell(word: String, isSwithActive: Bool) -> Bool {
        wordLabel.text = word
        chosenSwitch.onTintColor = UIColor.getPrimaryColor()
        value = isSwithActive
        chosenSwitch.isOn = value
        return value
    }

    
    @IBAction func changedBoolValue(sender: UISwitch) {
        value = sender.isOn
        delegate?.didChangeSwitchValue(value: value, word: wordLabel.text ?? "")
    }
}
