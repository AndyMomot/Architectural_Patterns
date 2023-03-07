//
//  DinamicData.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

class DinamicData<T> {
    typealias Observer = (T) -> Void
    private var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ observer: Observer?) {
        self.observer = observer
    }
}
