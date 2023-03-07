//
//  DitaileViewController.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import UIKit

class DitaileViewController: UIViewController {

    var coordinator: AppCoordinator!
    var viewModel: DetailViewModel!
    
    // MARK: - UICOMPONENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About You"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.model?.name
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.model?.city
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.model?.email
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.model?.phone
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension DitaileViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(cityLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        
        let width = Int(view.frame.width - 40)
        let height = 40
        let xPadding = 20
        
        titleLabel.frame = CGRect(x: xPadding, y: 60, width: width, height: height)
        nameLabel.frame = CGRect(x: xPadding, y: 60 + 10 + (height * 1), width: width, height: height)
        cityLabel.frame = CGRect(x: xPadding, y: 60 + 10 + (height * 2), width: width, height: height)
        emailLabel.frame = CGRect(x: xPadding, y: 60 + 10 + (height * 3), width: width, height: height)
        phoneLabel.frame = CGRect(x: xPadding, y: 60 + 10 + (height * 4), width: width, height: height)
    }
}
