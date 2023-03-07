//
//  MainVeiwModel.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

class MainViewModel {
    var login = ""
    var date = DinamicData(value: Date.now)
    var currentDate = DinamicData(value: "")
    
    func updateDate() {
        date = DinamicData(value: Date.now)
        currentDate.value = "\(date.value)"
    }
}
