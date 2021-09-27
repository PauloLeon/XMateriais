//
//  RegistrationCollaboratorViewController+UIPickerViewDelegate.swift
//  XMateriais
//
//  Created by Paulo Rosa on 27/09/21.
//  Copyright © 2021 Paulo Rosa. All rights reserved.
//

import UIKit

extension RegistrationCollaboratorViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewGender{
            return pickerGenderType.count
        }
        
        if pickerView == pickerViewSchooling{
            return pickerSchoolingType.count
        }
        return 0
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerViewGender{
            return pickerGenderType[row]
        }
        
        if pickerView == pickerViewSchooling{
            return pickerSchoolingType[row]
        }
        return nil
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewGender{
            self.genderTextField.text = pickerGenderType[row]
        }
        
        if pickerView == pickerViewSchooling{
            self.schoolingTextField.text = pickerSchoolingType[row]
        }
    }
    
    @objc func handelDatePicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePickerView.date)
    }
}
