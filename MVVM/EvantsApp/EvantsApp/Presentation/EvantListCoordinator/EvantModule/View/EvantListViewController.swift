//
//  EvantListViewController.swift
//  EvantsApp
//
//  Created by Андрей on 07.03.2023.
//

import UIKit

class EvantListViewController: UIViewController {
    
    // MARK: UI Components
    private lazy var rightBarButtonItem: UIBarButtonItem = {
       let plusImage = UIImage(systemName: "plus.circle.fill")
       let rightBarButtonItem = UIBarButtonItem(
        image: plusImage,
        style: .plain,
        target: self,
        action: #selector(tappedRightBarButtonItem)
       )
        rightBarButtonItem.tintColor = UIColor.primary
        return rightBarButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: Private functions
private extension EvantListViewController {
    @objc func tappedRightBarButtonItem() {
        print(#function)
    }
}

// MARK: Setup UI
private extension EvantListViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
