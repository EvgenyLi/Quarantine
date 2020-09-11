//
//  MainViewController.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit

class MainViewController: UIViewController, ModuleView, View {
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel>
    
    private let _tableView = UITableView()
    var disposeBag = DisposeBag()
    
    var output: MainViewModel.Input {
        return MainViewModel.Input(temp: Observable.just(()).asSignal(onErrorJustReturn: ()))
    }
    
    func bindViewModel(viewModel: MainViewModel) -> Disposable {
        Disposables.create(
            viewModel.dataSource.bind(to: _tableView.rx.items(dataSource: dataSource()))
        )
    }
    
    func bind(reactor: MainViewRactor) {
        Observable<Void>.just(())
            .map { Reactor.Action.increase}
            .bind(to: reactor.action)
        .dispose()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(_tableView)
        _tableView.delegate = self
        _tableView.scrollsToTop = true
        _tableView.separatorStyle = .none
        _tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            _tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            _tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            _tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            _tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        _tableView.register(class: RoundedCell.self)
    }
    
}

extension MainViewController {
    private func dataSource() -> RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel> {
        return RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel>(
            configureCell: { dataSource, table, idxPath, _ in
                switch dataSource[idxPath] {
                case let .first(items):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(items: items.map { EventCell.ViewState.init(image: $0.image, title: $0.title) }))
                    return cell
                case let .second(items):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(items: items.map { EventCell.ViewState.init(image: $0.image, title: $0.title) }))
                    return cell
                case let .third(items):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(items: items.map { EventCell.ViewState.init(image: $0.image, title: $0.title) }))
                    return cell
                }
        },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.title
        }
        )
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
