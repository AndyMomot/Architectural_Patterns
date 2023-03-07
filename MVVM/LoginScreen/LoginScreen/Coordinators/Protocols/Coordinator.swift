//
//  Coordinator.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    
    func start()
}
