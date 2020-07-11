//
//  MainCoordinator.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//
import UIKit

final class MainCoordinator: Coordinator {
    
    unowned let navigationController: UINavigationController
    private let _sceneFactory: SceneFactory
    
    init(navigationController: UINavigationController,
         sceneFactory: SceneFactory) {
        self.navigationController = navigationController
        self._sceneFactory = sceneFactory
    }
    
    func start() {
        let mainViewController = _sceneFactory.makeMainScene()
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    
}
