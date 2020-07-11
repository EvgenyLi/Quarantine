//
//  LoginViewModel.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift

final class LoginViewModel: ModuleViewModel {
    
    private let _coordinator: LoginCoordinator
    
    init(coordinator: LoginCoordinator) {
        _coordinator = coordinator
    }
    
    struct Input {
        let loginTap: Signal<Void>
    }
    
    func setup(with input: Input) -> Disposable {
        return Disposables.create([
            input.loginTap.asObservable()
            .subscribe(onNext: { _ in
                self._coordinator.pushMainScene()
            })
        ])
    }
}
