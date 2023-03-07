//
//  SceneDelegate.swift
//  EvantsApp
//
//  Created by Андрей on 07.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScen = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScen)
        self.window = window
        
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

