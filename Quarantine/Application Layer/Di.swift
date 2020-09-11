//
//  DI.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 08.07.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//
import UIKit

final class Di {
    
    fileprivate let _sceneFactory: SceneFactory
    
    init() {
        _sceneFactory = SceneFactoryImp()
    }
}

protocol SceneFactory {
    func makeMainScene() -> MainViewController
    func makeLoginScene(coordinator: LoginCoordinator) -> LoginViewController
}

// MARK: - SceneFactory

final class SceneFactoryImp: SceneFactory {
    func makeLoginScene(coordinator: LoginCoordinator) -> LoginViewController {
        let loginViewController = LoginViewController()
        let loginViewModel = LoginViewModel(coordinator: coordinator)
        loginViewController.bind(to: loginViewModel)
        return loginViewController
    }
    
    
    fileprivate weak var di: Di!
    fileprivate init(){}
    
    func makeMainScene() -> MainViewController {
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModel()
        mainViewController.bind(to: mainViewModel)
        return mainViewController
    }
}

protocol AppFactory {
    func makeKeyWindowWithCoordinator(window: UIWindow) -> Coordinator
        }

extension Di: AppFactory {
    func makeKeyWindowWithCoordinator(window: UIWindow) -> Coordinator {
            let cooridnator = AppCoordinator(window: window,
                                             sceneFactory: _sceneFactory,
                                             isUserLoggedIn: true)
            return cooridnator
        }

}
