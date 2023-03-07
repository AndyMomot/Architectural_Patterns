//
//  AppCoordinator.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import UIKit

enum LaunchInstructor {
    case auth
    case main
}


class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var launchInstructor: LaunchInstructor = .main
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        switch launchInstructor {
        case .auth:
            showAuth()
        case .main:
            showMain(login: User.logins.first?.login! ?? "")
        }
    }
    
    func showAuth() {
        let vc = LoginViewController()
        vc.coordinator = self
        vc.viewModel = LoginViewModel()
        vc.viewModel.launchInstructor = launchInstructor
        navigationController.pushViewController(vc, animated: true)

    }
    
    func showMain(login: String) {
        let vc = MainViewController()
        vc.coordinator = self
        let viewModel = MainViewModel()
        viewModel.login = login
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetails() {
        let vc = DitaileViewController()
        vc.coordinator = self
        let viewModel = DetailViewModel()
        viewModel.model = UserDataModel.userData
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

