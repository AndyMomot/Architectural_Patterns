//
//  AddEventViewModel.swift
//  EvantsApp
//
//  Created by Андрей on 09.03.2023.
//

import Foundation

final class AddEventViewModel {
    weak var coordinator: AddEventCoordinator?
    
    func viewDidDisapear() {
        coordinator?.didFinishAddEvent()
    }
}
