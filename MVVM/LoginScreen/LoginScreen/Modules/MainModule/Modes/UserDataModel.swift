//
//  UserDataModel.swift
//  LoginScreen
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

struct UserDataModel {
    var name: String
    var city: String
    var email: String
    var phone: String
}

extension UserDataModel {
    static var userData = UserDataModel(
        name: "Andrii",
        city: "Kharkiv",
        email: "andriiEmai@.com",
        phone: "+380 67 293 92 09"
    )
}
