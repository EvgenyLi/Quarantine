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

class MainViewController: UIViewController, ModuleView {
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel>
    
    private let _tableView = UITableView()
    
    var output: MainViewModel.Input {
        return MainViewModel.Input(temp: Observable.just(()).asSignal(onErrorJustReturn: ()))
    }
    
    func bindViewModel(viewModel: MainViewModel) -> Disposable {
        Disposables.create(
            viewModel.dataSource.bind(to: _tableView.rx.items(dataSource: dataSource()))
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(_tableView)
        
        _tableView.register(class: RoundedCell.self)
    }
    
    override func viewWillLayoutSubviews() {
        self._tableView.frame = self.view.frame
    }
    
}

extension MainViewController {
    private func dataSource() -> RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel> {
        return RxTableViewSectionedReloadDataSource<MainViewModel.SectionModel>(
            configureCell: { dataSource, table, idxPath, _ in
                switch dataSource[idxPath] {
                case let .ImageSectionItem(image, title):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(title: title))
                    return cell
                case let .StepperSectionItem(title):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(title: title))
                    return cell
                case let .ToggleableSectionItem(title, enabled):
                    let cell: RoundedCell = table.dequeueReusableCell(for: idxPath)
                    cell.render(.init(title: title))
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
