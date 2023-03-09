//
//  EventListViewModel.swift
//  EvantsApp
//
//  Created by Андрей on 09.03.2023.
//

import Foundation

final class EventListViewModel {
    let title = "Events"
    weak var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
