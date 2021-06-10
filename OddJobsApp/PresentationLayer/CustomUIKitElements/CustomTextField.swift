//
//  CustomTextField.swift
//  OddJobsApp
//
//  Created by Mac Use on 01.06.2021..
//

import UIKit

class CustomTextField: UITextField {
    //MARK: - Constants
    private let textFieldOpacity : CGFloat = 0.6
    private let topAndBottomInset : CGFloat = 10
    private let leftInset : CGFloat = 20
    private let rightInset : CGFloat = 20
    private let viewElementCornerRadius : CGFloat = 25
    private let textFieldFontSize: CGFloat = 18
    
    //MARK: - View vars
    private let insets: UIEdgeInsets
    
    //MARK: - Code
    init() {
        insets = UIEdgeInsets(top: topAndBottomInset, left: leftInset, bottom: topAndBottomInset, right: rightInset)
        super.init(frame: .zero)
        
        backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: textFieldOpacity)
        textColor = UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 1)
        font = UIFont(name: Fonts.regular, size: textFieldFontSize)
        layer.cornerRadius = viewElementCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("error loginTextField")
    }
    
    //MARK: - Additional functions
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
