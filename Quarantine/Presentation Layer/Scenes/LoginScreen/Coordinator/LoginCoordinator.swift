//
//  LoginCoordinator.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        let loginViewModel = LoginViewModel()
        loginViewController.bind(to: loginViewModel)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
