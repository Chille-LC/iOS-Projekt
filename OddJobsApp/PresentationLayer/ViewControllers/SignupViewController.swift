//
//  SignupViewController.swift
//  OddJobsApp
//
//  Created by Five on 10.06.2021..
//

import Foundation
import UIKit
import SnapKit

class SignupViewController: UIViewController {
    private var scrollView: UIScrollView!
    private var logoImage: UIImageView!
    private var nameTextField: CustomTextField!
    private var surnameTextField: CustomTextField!
    private var emailTextField: CustomTextField!
    private var passwordTextField: CustomTextField!
    private var confirmPasswordTextField: CustomTextField!
    private var phoneNumberTextField: CustomTextField!
    private var hidePasswordButton: UIButton!
    private var hideCPasswordButton: UIButton!
    private var signupButton: UIButton!
    private var errorLabel: UILabel!
    private var loginLabel: UILabel!
    private var loginButton: UIButton!
    private var loginField: UIView!
    private var loginSeparator: UIView!
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
        scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 774)
                
        createLogoImage()
        createTextFields()
        createSignupButton()
        createErrorLabel()
        createLoginField()
        
        scrollView.addSubview(logoImage)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(surnameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(confirmPasswordTextField)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(hidePasswordButton)
        scrollView.addSubview(hideCPasswordButton)
        scrollView.addSubview(signupButton)
        scrollView.addSubview(errorLabel)
        
        view.addSubview(scrollView)
        view.addSubview(loginField)
    }
    
    func createLogoImage() {
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
    }
    
    func createTextFields() {
        nameTextField = CustomTextField()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        nameTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        nameTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        surnameTextField = CustomTextField()
        surnameTextField.attributedPlaceholder = NSAttributedString(string: "Surname",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        surnameTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        surnameTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        surnameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
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
        hidePasswordButton.addTarget(self, action: #selector(visibilityChanged1), for: .touchUpInside)
        
        confirmPasswordTextField = CustomTextField()
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirm password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        hideCPasswordButton = UIButton()
        hideCPasswordButton.setImage(UIImage(named: "Hide")?.withRenderingMode(.alwaysTemplate), for: .normal)
        hideCPasswordButton.tintColor = MainColors.darkBlue
        hideCPasswordButton.addTarget(self, action: #selector(visibilityChanged2), for: .touchUpInside)
        
        phoneNumberTextField = CustomTextField()
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "Phone number",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1/255, green: 0, blue: 44/255, alpha: 0.6)])
        phoneNumberTextField.addTarget(self, action: #selector(textFieldSelected), for: .editingDidBegin)
        phoneNumberTextField.addTarget(self, action: #selector(textFieldNotSelected), for: .editingDidEnd)
        phoneNumberTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        phoneNumberTextField.keyboardType = .numberPad
    }
    
    func createSignupButton() {
        signupButton = UIButton()
        signupButton.layer.cornerRadius = 25
        signupButton.backgroundColor = MainColors.primaryOrange
        
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.setAttributedTitle(NSAttributedString(string: "Signup", attributes: [.font: UIFont(name: Fonts.extraBold, size: 25) ?? UIFont.systemFont(ofSize: 25)]), for: .normal)
        
        signupButton.isEnabled = false
        signupButton.alpha = 0.6
        
        signupButton.addTarget(self, action: #selector(signup), for: .touchUpInside)
    }
    
    func createErrorLabel() {
        errorLabel = UILabel()
        errorLabel.font = UIFont(name: Fonts.bold, size: 14)
        errorLabel.isHidden = true
        errorLabel.textColor = .red
    }
    
    func createLoginField() {
        loginLabel = UILabel()
        loginLabel.textColor = MainColors.darkBlue
        loginLabel.text = "Already have an account?"
        
        loginButton = UIButton()
        loginButton.setAttributedTitle(NSAttributedString(string: "Log in!", attributes: [.font: UIFont(name: Fonts.extraBold, size: 14) ?? UIFont.systemFont(ofSize: 14)]), for: .normal)
        loginButton.setTitleColor(MainColors.primaryOrange, for: .normal)
        loginButton.addTarget(self, action: #selector(returnToLogin), for: .touchUpInside)
        
        loginSeparator = UIView()
        loginSeparator.backgroundColor = .lightGray
        
        loginField = UIView()
        loginField.backgroundColor = .white
        loginField.addSubview(loginLabel)
        loginField.addSubview(loginButton)
        loginField.addSubview(loginSeparator)
    }
    
    func addConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().offset(-40)
            //$0.bottom.equalTo(loginField.snp.top)
        }
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(200)
            $0.width.equalTo(200)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(logoImage.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        surnameTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(surnameTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        hidePasswordButton.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-10)
            $0.height.equalTo(35)
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.width.equalTo(35)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        hideCPasswordButton.snp.makeConstraints {
            $0.trailing.equalTo(confirmPasswordTextField.snp.trailing).offset(-10)
            $0.height.equalTo(35)
            $0.centerY.equalTo(confirmPasswordTextField.snp.centerY)
            $0.width.equalTo(35)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(10)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            $0.leading.equalTo(signupButton.snp.leading)
        }
        
        loginField.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(loginLabel.snp.trailing).offset(5)
            //$0.trailing.equalToSuperview().offset()
        }
        
        loginSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    @objc func signup(_ button: UIButton){
        if (emailTextField.text == "username" && passwordTextField.text == "password"){
            coordinator.setJobsMenuVC()
        }
        else {
            errorLabel.text = "Email or password is incorrect!"
            errorLabel.isHidden = false
        }
    }
    
    @objc func returnToLogin(_ button: UIButton) {
        coordinator.returnToLoginVC()
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
            signupButton.alpha = 1
            signupButton.isEnabled = true
        }
        else {
            signupButton.alpha = 0.6
            signupButton.isEnabled = false
        }
        errorLabel.isHidden = true
    }
    
    @objc func visibilityChanged1(_ button: UIButton) {
        if passwordTextField.isSecureTextEntry == true {
            //hidePasswordButton.setImage(UIImage(named: "Hide"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            //hidePasswordButton.setImage(UIImage(named: "Show"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
     }
    
    @objc func visibilityChanged2(_ button: UIButton) {
        if confirmPasswordTextField.isSecureTextEntry == true {
            //hideCPasswordButton.setImage(UIImage(named: "Hide"), for: .normal)
            confirmPasswordTextField.isSecureTextEntry = false
        } else {
            //hideCPasswordButton.setImage(UIImage(named: "Show"), for: .normal)
            confirmPasswordTextField.isSecureTextEntry = true
        }
     }
}
