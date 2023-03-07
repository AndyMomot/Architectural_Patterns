//
//  ViewController.swift
//  LoginScreen
//
//  Created by Андрей on 01.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - PROPERTIES
    var viewModel: LoginViewModel!
    var coordinator: AppCoordinator?
    
   // MARK: - UI COMPONENTS
    private lazy var loginField: UITextField = {
        let field = UITextField()
        field.placeholder = "   login"
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "   password"
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        initialStateForStatusLabel()
    }
    
    // MARK: - IBAction
    @objc func loginButtonPressed(_ sender: UIButton) {
        viewModel.loginButtonPressed(
            login: loginField.text ?? "",
            password: passwordField.text ?? ""
        )
        
        DispatchQueue.main.async { [weak self] in
            self?.viewModel.switchColorStyle()
        }
        
        if viewModel.launchInstructor == .main {
            coordinator?.launchInstructor = viewModel.launchInstructor
            coordinator?.showMain(login: loginField.text ?? "Empti login field")
        }
    }

    // MARK: - FUNCTIONS
    func initialStateForStatusLabel() {
        statusLabel.textColor = .clear
    }
    
    func bindViewModel() {
        viewModel.statusText.bind { [weak self] statusText in
            DispatchQueue.main.async { [weak self] in
                self?.statusLabel.text = statusText
                self?.statusLabel.isHidden = false
            }
        }
        
        viewModel.statusColor.bind { [weak self] color in
            DispatchQueue.main.async { [weak self] in
                self?.statusLabel.textColor = color
            }
        }
        
        // Change color Style
//        viewModel.colorStyle.bind { [weak self] color in
//            DispatchQueue.main.async { [weak self] in
//                self?.view.backgroundColor = color
//            }
//        }
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(statusLabel)
        
        let width = Int(view.frame.width - 40)
        let height = 40
        let xPadding = 20
        loginField.frame = CGRect(x: xPadding, y: 80, width: width, height: height)
        passwordField.frame = CGRect(x: xPadding, y: 130, width: width, height: height)
        loginButton.frame = CGRect(x: xPadding, y: 200, width: width, height: height)
        statusLabel.frame = CGRect(x: xPadding, y: 260, width: width, height: height)
        
    }
}

