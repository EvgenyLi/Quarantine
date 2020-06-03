//
//  ModuleView.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

public protocol ModuleView: class {

    associatedtype ViewModel: ModuleViewModel

    var output: ViewModel.Input { get }

    func bindViewModel(viewModel: ViewModel) -> Disposable
}

extension ModuleView where Self: UIViewController {
    func bind(to model: Self.ViewModel) {
      //  viewModel = model
        loadViewIfNeeded()
        _ = bindViewModel(viewModel: model)
        _ = model.setup(with: output)
    }
}

extension ModuleView where Self: UITableViewCell {
    func bind(to model: Self.ViewModel) {
      //  viewModel = model
        _ = bindViewModel(viewModel: model)
    }
}

extension ModuleView where Self: UICollectionViewCell {
    func bind(to model: Self.ViewModel) {
     //   viewModel = model
        _ = bindViewModel(viewModel: model)
    }
}
