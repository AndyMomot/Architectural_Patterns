//
//  ViewModel.swift
//  LoginScreen
//
//  Created by Андрей on 01.03.2023.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.clear)
    var colorStyle = Dynamic(UIColor.systemBackground)
    var launchInstructor: LaunchInstructor = .auth
    
    func loginButtonPressed(login: String, password: String) {
        guard let user = User.logins.first else { return }
        if login != user.login || password != user.password {
            statusText.value = "Log in failed!"
            statusColor.value = .red
             launchInstructor = .auth
        } else {
            statusText.value = "Succesfuly lodded in!"
            statusColor.value = .systemGreen
            launchInstructor = .main
        }
    }
    
    func switchColorStyle() {
        if colorStyle.value == UIColor.systemBackground {
            colorStyle.value = UIColor.darkGray
        } else {
            colorStyle.value = UIColor.systemBackground
        }
    }
}
