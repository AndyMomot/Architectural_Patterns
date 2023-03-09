//
//  AddEventViewController.swift
//  EvantsApp
//
//  Created by Андрей on 09.03.2023.
//

import UIKit

class AddEventViewController: UIViewController {

    var addEventViewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEventViewModel.viewDidDisapear()
    }
}

private extension AddEventViewController {
    func setupUI() {
        view.backgroundColor = .systemGreen
    }
}
