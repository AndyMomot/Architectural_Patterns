//
//  MainViewController.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - PROPERTIES
    var coordinator: AppCoordinator!
    var viewModel: MainViewModel!
    var counter = 1
    
    // MARK: - UICOMPONENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, \(viewModel.login)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some description, Some description, Some description, Some description, Some description"
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionButton: UIButton = {
       let button = UIButton()
        button.setTitle("About you", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(descButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var spinButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "rotate.left.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(spinButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var spinView: UIView = {
        let spinView = UIView()
        spinView.backgroundColor = .lightGray
        spinView.layer.borderWidth = 1
        spinView.layer.borderColor = UIColor.darkGray.cgColor
        
        spinView.layer.shadowColor = UIColor.black.cgColor
        spinView.layer.shadowOffset = CGSize(width: 2, height: 2)
        spinView.layer.shadowRadius = 4
        spinView.layer.shadowOpacity = 1
        spinView.translatesAutoresizingMaskIntoConstraints = false
        return spinView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.currentDate.value
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
}

private extension MainViewController {
    func bindViewModel() {
        
       viewModel.currentDate.bind { text in
            DispatchQueue.main.async {
                self.dateLabel.text = text
            }
        }
    }
    
    @objc func descButtonTapped() {
        coordinator.showDetails()
    }
    
    @objc func spinButtonTapped() {
        startSpinView()
        viewModel.updateDate()
    }
    
    func startSpinView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: CGFloat(self.counter),
                delay: 0.2,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0.1)
            { [self] in
                self.spinView.transform = (self.spinView.transform.rotated(by: .pi / 2))
            }
        }
        
        if counter < 5 {
            counter += 1
        } else if counter == 5 {
            counter = 1
        }
    }
}



private extension MainViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        setupLabel()
        setupDescriptionLabel()
        setupDescriptionButton()
        setupSpinButton()
        setupSpinView()
        setupDateLabel()
    }
    
    func setupLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func setupDescriptionButton() {
        view.addSubview(descriptionButton)
        NSLayoutConstraint.activate([
            descriptionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            descriptionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSpinButton() {
        view.addSubview(spinButton)
        NSLayoutConstraint.activate([
            spinButton.topAnchor.constraint(equalTo: descriptionButton.bottomAnchor, constant: 40),
            spinButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            spinButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            spinButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSpinView() {
        view.addSubview(spinView)
        NSLayoutConstraint.activate([
            spinView.topAnchor.constraint(equalTo: spinButton.bottomAnchor, constant: 40),
            spinView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinView.heightAnchor.constraint(equalToConstant: 100),
            spinView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupDateLabel() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: spinView.bottomAnchor, constant: 40),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
}
