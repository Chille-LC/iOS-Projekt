//
//  CategoryPicker.swift
//  OddJobsApp
//
//  Created by Luka Cicak on 09.06.2021..
//

import Foundation
import UIKit

class CategoryPicker : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {

    var categoryArray : [String]!
    var pickerTextField : UITextField!
 
    init(pickerData: [String], dropdownField: UITextField) {
        super.init(frame: CGRect.zero)
 
        self.categoryArray = pickerData
        self.pickerTextField = dropdownField
 
        self.delegate = self
        self.dataSource = self
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
 
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = categoryArray[row]
    }
 
 
}
