//
//  User.swift
//  LoginScreen
//
//  Created by Андрей on 01.03.2023.
//

import Foundation

struct User {
    var login: String?
    var password: String?
}

extension User {
    static var logins = [
        User(login: "Login", password: "12345")
    ]
}
