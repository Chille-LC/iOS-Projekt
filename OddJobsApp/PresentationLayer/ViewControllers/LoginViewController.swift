//
//  LoginViewController.swift
//  OddJobsApp
//
//  Created by Five on 06.06.2021..
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private var logoImage: UIImageView!
    private var emailTextField: CustomTextField!
    private var passwordTextField: CustomTextField!
    private var hidePasswordButton: UIButton!
    private var loginButton: UIButton!
    private var errorLabel: UILabel!
    private var coordinator: NavigationCoordinator!
    
    convenience init(coordinator: NavigationCoordinator) {
        self.init()
        
        self.coordinator = coordinator
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
    }
    
    func buildViews() {
        view.backgroundColor = .white
        
        createLogoImage()
        createTextFields()
        createLoginButton()
        createErrorLabel()
        
        view.addSubview(logoImage)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(hidePasswordButton)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
    }
    
    func createLogoImage() {
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
    }
    
    func createTextFields() {
        emailTextField = CustomTextField()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        emailTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        emailTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        passwordTextField = CustomTextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        passwordTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        hidePasswordButton = UIButton()
        hidePasswordButton.setImage(UIImage(named: "Hide")?.withRenderingMode(.alwaysTemplate), for: .normal)
        hidePasswordButton.tintColor = MainColors.darkBlue
        hidePasswordButton.addTarget(self, action: #selector(visibilityChanged), for: .touchUpInside)
    }
    
    func createLoginButton() {
        loginButton = UIButton()
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = MainColors.primaryOrange
        
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setAttributedTitle(NSAttributedString(string: "Login", attributes: [.font: UIFont(name: Fonts.extraBold, size: 25) ?? UIFont.systemFont(ofSize: 25)]), for: .normal)
        
        loginButton.isEnabled = false
        loginButton.alpha = 0.6
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    func createErrorLabel() {
        errorLabel = UILabel()
        errorLabel.isHidden = true
        errorLabel.textColor = .red
    }
    
    func addConstraints() {
        logoImage.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.centerY.equalTo(emailTextField.snp.top).multipliedBy(0.5)
            $0.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.35)
            $0.width.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.35)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.centerY).offset(10)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        hidePasswordButton.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-10)
            $0.height.equalTo(35)
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.width.equalTo(35)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.leading.equalTo(loginButton.snp.leading)
        }
    }
    
    @objc func login(_ button: UIButton){
        if (emailTextField.text == "username" && passwordTextField.text == "password"){
            coordinator.setJobsMenuVC()
        }
        else {
            errorLabel.text = "Email or password is incorrect!"
            errorLabel.isHidden = false
        }
    }
    
    @objc func textFieldSelected(_ textField: CustomTextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = MainColors.darkBlue.cgColor
        errorLabel.isHidden = true
    }
    
    @objc func textFieldNotSelected(_ textField: CustomTextField) {
        textField.layer.borderWidth = 0
    }
    
    @objc func textFieldChanged(_ textField: CustomTextField) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            loginButton.alpha = 1
            loginButton.isEnabled = true
        }
        else {
            loginButton.alpha = 0.6
            loginButton.isEnabled = false
        }
        errorLabel.isHidden = true
    }
    
    @objc func visibilityChanged(_ button: UIButton) {
        if passwordTextField.isSecureTextEntry == true {
            //hidePasswordButton.setImage(UIImage(named: "Hide"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            //hidePasswordButton.setImage(UIImage(named: "Show"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
     }
}
