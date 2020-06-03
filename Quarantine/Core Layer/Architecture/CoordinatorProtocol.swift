//
//  CoordinatorProtocol.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 08.03.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import Foundation
import RxSwift
 
protocol Coordinator: class {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
