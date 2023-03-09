//
//  AddEventCoordinator.swift
//  EvantsApp
//
//  Created by Андрей on 09.03.2023.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController = AddEventViewController()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.addEventViewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
}
