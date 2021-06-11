//
//  SettingsViewController.swift
//  OddJobsApp
//
//  Created by Luka Cicak on 10.06.2021..
//

import Foundation
import UIKit
import SnapKit

class SettingsViewController: UIViewController, UITextFieldDelegate{
    
    private var phoneNumber: UILabel!
    private var numberStatement: UILabel!
    private var username: UILabel!
    private var earned: UILabel!
    private var earnedStatement: UILabel!
    private var settingsLabel: UILabel!
    
    
    
    private var myJobsButton: UIButton!
    private var logoutButton: UIButton!
    
    private var coordinator: NavigationCoordinator!
    
    private var topBoxView: UIView!
    private var gradientLayer: CAGradientLayer!
    
    convenience init(coordinator: NavigationCoordinator) {
        self.init()
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
    }
    
    private func buildViews(){
        
        view.backgroundColor = .white
        
        topBoxView = UIView()
        topBoxView.layer.cornerRadius = 45
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.cornerRadius = 45
        gradientLayer.shadowRadius = 4.0
        gradientLayer.shadowOpacity = 0.2
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOffset = CGSize(width: 0, height: 5)
        
        settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.font = UIFont(name: Fonts.extraBold, size: 30)
        settingsLabel.textColor = .white
        settingsLabel.textAlignment = .center
        settingsLabel.adjustsFontSizeToFitWidth = true
        
        phoneNumber = UILabel()
        phoneNumber.text = "+385 91 342 7780"
        phoneNumber.textColor = MainColors.darkBlue
        phoneNumber.font = UIFont(name: Fonts.semiBold, size: 25)
        phoneNumber.textAlignment = .left
        phoneNumber.adjustsFontSizeToFitWidth = true
        
        numberStatement = UILabel()
        numberStatement.text = "PHONE NUMBER"
        numberStatement.textColor = MainColors.darkBlue
        numberStatement.font = UIFont(name: Fonts.semiBold, size: 20)
        numberStatement.textAlignment = .left
        numberStatement.adjustsFontSizeToFitWidth = true
        
        earnedStatement = UILabel()
        earnedStatement.text = "TOTAL EARNINGS"
        earnedStatement.textColor = MainColors.darkBlue
        earnedStatement.font = UIFont(name: Fonts.semiBold, size: 20)
        earnedStatement.textAlignment = .left
        earnedStatement.adjustsFontSizeToFitWidth = true
        
        earned = UILabel()
        earned.text = "300$"
        earned.textColor = MainColors.darkBlue
        earned.font = UIFont(name: Fonts.semiBold, size: 25)
        earned.textAlignment = .left
        earned.adjustsFontSizeToFitWidth = true
        
        username = UILabel()
        username.text = "John Doe"
        username.textAlignment = .left
        username.adjustsFontSizeToFitWidth = true
        username.textColor = MainColors.darkBlue
        username.font = UIFont(name: Fonts.extraBold, size: 35)
        username.adjustsFontSizeToFitWidth = true
        
        myJobsButton = UIButton()
        myJobsButton.setTitle("My Jobs", for: .normal)
        myJobsButton.backgroundColor = MainColors.darkBlue
        myJobsButton.titleLabel?.font = UIFont(name: Fonts.bold, size: 25)
        myJobsButton.setTitleColor(.white, for: .normal)
        
        logoutButton = UIButton()
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.backgroundColor = MainColors.darkBlue
        logoutButton.titleLabel?.font = UIFont(name: Fonts.bold, size: 25)
        logoutButton.setTitleColor(.white, for: .normal)
        
        topBoxView.layer.addSublayer(gradientLayer)
        view.addSubview(topBoxView)
        view.addSubview(numberStatement)
        view.addSubview(earnedStatement)
        
        view.addSubview(settingsLabel)
        view.addSubview(earned)
        view.addSubview(username)
        view.addSubview(phoneNumber)
        
        view.addSubview(logoutButton)
        view.addSubview(myJobsButton)
        
    }
    
    private func addConstraints(){
        
        topBoxView.snp.makeConstraints{ make -> Void in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(username.snp.top).offset(-7)
            make.width.equalToSuperview()
        }
        
        settingsLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.07)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        username.snp.makeConstraints{ make -> Void in
            make.top.equalTo(settingsLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalToSuperview().dividedBy(10)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        numberStatement.snp.makeConstraints{ make -> Void in
            make.top.equalTo(username.snp.bottom).offset(10)
            make.height.equalTo(phoneNumber.snp.height).dividedBy(2)
            make.width.equalTo(phoneNumber.snp.width).dividedBy(2)
            make.left.equalTo(phoneNumber.snp.left)
        }
        
        phoneNumber.snp.makeConstraints{ make -> Void in
            make.top.equalTo(numberStatement.snp.bottom).offset(5)
            make.left.equalTo(username.snp.left)
            make.height.equalTo(username.snp.height).multipliedBy(0.6)
            make.width.equalTo(username.snp.width).multipliedBy(0.8)
        }
        
        earnedStatement.snp.makeConstraints{ make -> Void in
            make.top.equalTo(phoneNumber.snp.bottom).offset(10)
            make.height.equalTo(numberStatement.snp.height)
            make.width.equalTo(numberStatement.snp.width)
            make.left.equalTo(numberStatement.snp.left)
        }
        
        earned.snp.makeConstraints{ make -> Void in
            make.top.equalTo(earnedStatement.snp.bottom).offset(5)
            make.height.equalTo(phoneNumber.snp.height)
            make.width.equalTo(phoneNumber.snp.width)
            make.left.equalTo(phoneNumber.snp.left)
        }
        
        myJobsButton.snp.makeConstraints{ make -> Void in
            make.top.equalTo(earned.snp.bottom).offset(80)
            make.height.equalTo(phoneNumber.snp.height).multipliedBy(1.1)
            make.width.equalTo(phoneNumber.snp.width)
            make.centerX.equalToSuperview()
        }
                
        logoutButton.snp.makeConstraints{ make -> Void in
            make.top.equalTo(myJobsButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(myJobsButton.snp.width)
            make.height.equalTo(myJobsButton.snp.height)
        }
    }
    
    @objc func logoutButtonPressed(){
        self.coordinator.logout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = topBoxView.bounds
        logoutButton.layer.cornerRadius = logoutButton.bounds.height / 2.5
        myJobsButton.layer.cornerRadius = myJobsButton.bounds.height / 2.5
    }
}
