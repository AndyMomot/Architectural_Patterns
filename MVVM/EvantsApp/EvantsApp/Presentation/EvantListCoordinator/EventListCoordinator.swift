//
//  EvantListCoordinator.swift
//  EvantsApp
//
//  Created by Андрей on 07.03.2023.
//

import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let evantListViewController = EvantListViewController()
        navigationController.setViewControllers(
            [evantListViewController],
            animated: false
        )
    }
    
    
}
