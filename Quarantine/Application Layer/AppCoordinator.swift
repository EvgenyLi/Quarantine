//
//  AppCoordinator.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class AppCoordinator: Coordinator {

    let window: UIWindow
    private let _sceneFactory: SceneFactory
    private let _isUserLoggedIn: Bool
    
    init(window: UIWindow,
         sceneFactory: SceneFactory,
         isUserLoggedIn: Bool) {
        self.window = window
        self._sceneFactory = sceneFactory
        self._isUserLoggedIn = isUserLoggedIn
    }
    
       func start() {
           let navigationController = UINavigationController()
           if #available(iOS 13.0, *) {
               navigationController.overrideUserInterfaceStyle = .light
           }
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        if _isUserLoggedIn {
            mainFlow(navigationController: navigationController)
        } else {
            loginFlow(navigationController: navigationController)
        }

       }
    
    private func mainFlow(navigationController: UINavigationController) {
        let mainCoordinator = MainCoordinator(navigationController: navigationController,
        sceneFactory: _sceneFactory)
        coordinate(to: mainCoordinator)
    }
    
    private func loginFlow(navigationController: UINavigationController) {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController,
        sceneFactory: _sceneFactory)
        coordinate(to: loginCoordinator)
    }
}
