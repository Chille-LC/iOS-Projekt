//
//  TextFieldExtension.swift
//  OddJobsApp
//
//  Created by Luka Cicak on 09.06.2021..
//

import Foundation
import UIKit
 
extension UITextField {
    func loadDropdownCategories(data: [String]) {
        self.inputView = CategoryPicker(pickerData: data, dropdownField: self)
    }}
