//
//  AddJobViewController.swift
//  OddJobsApp
//
//  Created by Luka Cicak on 09.06.2021..
//

import Foundation
import UIKit
import SnapKit

class AddJobViewController: UIViewController {
    
    //top of screen
    private var topBoxView: UIView!
    private var gradientLayer: CAGradientLayer!
    private var postLabel: UILabel!
    
    //view gradients
    private var titleGradientLayer: CAGradientLayer!
    private var priceGradientLayer: CAGradientLayer!
    private var categoryGradientLayer: CAGradientLayer!
    private var descriptionGradientLayer: CAGradientLayer!
    
    //labels
    private var priceLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var titleLabel: UILabel!
    private var categoryLabel: UILabel!
    
    //views for textfields
    private var priceView: UIView!
    private var titleView: UIView!
    private var categoryView: UIView!
    private var descriptionView: UIView!
    
    //textfields
    private var titleField: TextFieldWithPadding!
    private var descriptionField: UITextView!
    private var priceField: TextFieldWithPadding!
    private var categoryField: TextFieldWithPadding!
    
    //button
    private var submitButton: UIButton!
    
    //coordinator
    var coordinator: NavigationCoordinator!
    
    convenience init(coordinator: NavigationCoordinator) {
        self.init()
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
    }
    
    private func buildViews(){
        
        view.backgroundColor = .white
        
        //top of screen
        
        topBoxView = UIView()
        topBoxView.layer.cornerRadius = 45
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.cornerRadius = 45
        gradientLayer.shadowRadius = 4.0
        gradientLayer.shadowOpacity = 0.2
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOffset = CGSize(width: 0, height: 5)
        
        postLabel = UILabel()
        postLabel.text = "Add Job"
        postLabel.font = UIFont(name: Fonts.extraBold, size: 30)
        postLabel.textColor = .white
        postLabel.textAlignment = .center
        postLabel.adjustsFontSizeToFitWidth = true
        
        //labels
        
        titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.font = UIFont(name: Fonts.extraBold, size: 15)
        titleLabel.textColor = MainColors.darkBlue
        titleLabel.adjustsFontSizeToFitWidth = true
        
        categoryLabel = UILabel()
        categoryLabel.text = "Category"
        categoryLabel.font = UIFont(name: Fonts.extraBold, size: 15)
        categoryLabel.textColor = MainColors.darkBlue
        categoryLabel.adjustsFontSizeToFitWidth = true
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: Fonts.extraBold, size: 15)
        descriptionLabel.textColor = MainColors.darkBlue
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        priceLabel = UILabel()
        priceLabel.text = "Price (in $)"
        priceLabel.font = UIFont(name: Fonts.extraBold, size: 15)
        priceLabel.textColor = MainColors.darkBlue
        priceLabel.adjustsFontSizeToFitWidth = true
        
        //gradients
        
        titleGradientLayer = addGradient(gradientArray: gradientColorsSecondary)
        priceGradientLayer = addGradient(gradientArray: gradientColorsSecondary)
        categoryGradientLayer = addGradient(gradientArray: gradientColorsSecondary)
        descriptionGradientLayer = addGradient(gradientArray: gradientColorsSecondary)
        descriptionGradientLayer.cornerRadius = 15
        
        //views
        
        titleView = UIView()
        titleView.layer.addSublayer(titleGradientLayer)
        
        priceView = UIView()
        priceView.layer.addSublayer(priceGradientLayer)
        
        categoryView = UIView()
        categoryView.layer.addSublayer(categoryGradientLayer)
        
        descriptionView = UIView()
        descriptionView.layer.cornerRadius = 15
        descriptionView.layer.addSublayer(descriptionGradientLayer)
        
        //textfields
        
        titleField = TextFieldWithPadding()
        titleField.font = UIFont(name: Fonts.semiBold, size: 20)
        titleField.textColor = MainColors.darkBlue
        titleField.adjustsFontSizeToFitWidth = true
        titleField.layer.borderWidth = 0.8
        titleField.layer.borderColor = MainColors.secondaryGray.cgColor
        
        priceField = TextFieldWithPadding()
        priceField.font = UIFont(name: Fonts.semiBold, size: 20)
        priceField.keyboardType = .numberPad
        priceField.textColor = MainColors.darkBlue
        priceField.adjustsFontSizeToFitWidth = true
        priceField.layer.borderWidth = 0.8
        priceField.layer.borderColor = MainColors.secondaryGray.cgColor
        
        let categories = JobCategory.allCases.map { $0.rawValue.lowercased().capitalized }
        
        categoryField = TextFieldWithPadding()
        categoryField.font = UIFont(name: Fonts.semiBold, size: 20)
        categoryField.loadDropdownCategories(data: categories)
        categoryField.textColor = MainColors.darkBlue
        categoryField.adjustsFontSizeToFitWidth = true
        categoryField.layer.borderWidth = 0.8
        categoryField.layer.borderColor = MainColors.secondaryGray.cgColor
        
        descriptionField = UITextView()
        descriptionField.font = UIFont(name: Fonts.semiBold, size: 20)
        descriptionField.textColor = MainColors.darkBlue
        descriptionField.backgroundColor = .none
        descriptionField.layer.cornerRadius = 15
        descriptionField.layer.borderWidth = 0.8
        descriptionField.layer.borderColor = MainColors.secondaryGray.cgColor
        descriptionField.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        //button
        
        submitButton = UIButton()
        submitButton.backgroundColor = MainColors.darkBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.setTitleColor(.white.withAlphaComponent(0.3), for: .disabled)
        submitButton.titleLabel?.font = UIFont(name: Fonts.bold, size: 25)
        submitButton.setTitle("Submit", for: .normal)
        
        topBoxView.layer.addSublayer(gradientLayer)
        view.addSubview(topBoxView)
        
        titleView.addSubview(titleField)
        priceView.addSubview(priceField)
        categoryView.addSubview(categoryField)
        descriptionView.addSubview(descriptionField)
        
        view.addSubview(titleView)
        view.addSubview(priceView)
        view.addSubview(categoryView)
        view.addSubview(descriptionView)
        
        view.addSubview(postLabel)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(categoryLabel)
        view.addSubview(submitButton)
    }
    
    private func addConstraints(){
        
        topBoxView.snp.makeConstraints { make -> Void in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(titleLabel.snp.top).offset(-7)
            make.width.equalToSuperview()
        }
        
        postLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.07)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        titleLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(postLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(postLabel.snp.height).multipliedBy(0.6)
        }
        
        titleView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(postLabel.snp.height).multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        titleField.snp.makeConstraints{ make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.left.equalTo(titleLabel.snp.left)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(titleLabel.snp.height)
        }
        
        categoryView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(categoryLabel.snp.bottom).offset(5)
            make.left.equalTo(titleView.snp.left)
            make.height.equalTo(titleView.snp.height)
            make.width.equalTo(titleView.snp.width)
        }
        
        categoryField.snp.makeConstraints{ make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(categoryView.snp.bottom).offset(10)
            make.left.equalTo(titleLabel.snp.left)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(titleLabel.snp.height)
        }
        
        descriptionView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(titleView.snp.left)
            make.height.equalTo(titleView.snp.height).multipliedBy(3)
            make.width.equalTo(titleView.snp.width)
        }
        
        descriptionField.snp.makeConstraints{ make -> Void in
            make.top.equalTo(descriptionView.snp.top)
            make.bottom.equalTo(descriptionView.snp.bottom)
            make.left.equalTo(descriptionView.snp.left)
            make.right.equalTo(descriptionView.snp.right)
        }
        
        priceLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(descriptionView.snp.bottom).offset(10)
            make.left.equalTo(titleLabel.snp.left)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(titleLabel.snp.height)
        }
        
        priceView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.left.equalTo(titleView.snp.left)
            make.height.equalTo(titleView.snp.height)
            make.width.equalTo(titleView.snp.width)
        }
        
        priceField.snp.makeConstraints{ make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints{ make -> Void in
            make.top.equalTo(priceView.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerX.equalToSuperview()
            make.height.equalTo(priceView)
        }
    }
    
    override func viewDidLayoutSubviews(){
        
        super.viewDidLayoutSubviews()
        gradientLayer.frame = topBoxView.bounds
        submitButton.layer.cornerRadius = submitButton.bounds.height / 2.5
        
        titleGradientLayer.frame = titleView.bounds
        categoryGradientLayer.frame = categoryView.bounds
        priceGradientLayer.frame = priceView.bounds
        descriptionGradientLayer.frame = descriptionView.bounds
        
        titleView.layer.cornerRadius = titleView.bounds.height / 4
        categoryView.layer.cornerRadius = categoryView.bounds.height / 4
        priceView.layer.cornerRadius = priceView.bounds.height / 4
        
        titleGradientLayer.cornerRadius = titleView.bounds.height / 4
        categoryGradientLayer.cornerRadius = categoryView.bounds.height / 4
        priceGradientLayer.cornerRadius = priceView.bounds.height / 4
    }
    
    func addGradient(gradientArray: [CGColor]) -> CAGradientLayer {
        let gradient:CAGradientLayer = CAGradientLayer()
        
        gradient.colors = gradientArray
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        return gradient
    }
    
}

