//
//  LoginViewController.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, ModuleView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        view.addSubview(loginButton)
    }
    
    var output: LoginViewModel.Input {
        return LoginViewModel.Input(loginTap: loginButton.rx.tap.asSignal())
    }
    
    func bindViewModel(viewModel: LoginViewModel) -> Disposable {
        Disposables.create()
    }
    
    // MARK: Private
    private let _bag = DisposeBag()
    private let loginButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        bt.setTitle("Login", for: .normal)
        bt.backgroundColor = .black
        return bt
    }()
    
}
