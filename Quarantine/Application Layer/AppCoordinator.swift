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
    
    init(window: UIWindow) {
        self.window = window
    }
    
       func start() {
           let navigationController = UINavigationController()
           if #available(iOS 13.0, *) {
               navigationController.overrideUserInterfaceStyle = .light
           }
           window.rootViewController = navigationController
           window.makeKeyAndVisible()
        
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        coordinate(to: loginCoordinator)

       }
}
