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
        let viewModel = EventListViewModel()
        viewModel.coordinator = self
        evantListViewController.eventViewModel = viewModel
        
        navigationController.setViewControllers(
            [evantListViewController],
            animated: false
        )
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
