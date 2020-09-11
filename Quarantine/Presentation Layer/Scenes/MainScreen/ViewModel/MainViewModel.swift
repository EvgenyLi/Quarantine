//
//  MainModelViewController.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 04.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class MainViewModel: ModuleViewModel {
    
    // MARK: - Public
    let dataSource = BehaviorRelay<[SectionModel]>(value: [])
    
    struct Input {
        let temp: Signal<Void>
    }
    
    func setup(with input: Input) -> Disposable {
        return Disposables.create([])
    }
    
    init() {
        _configureDataSource()
    }
    
    private func _configureDataSource() {
        
        let sections: [SectionModel] = [
            .ImageProvidableSection(title: "Категория 1",
                                    items: [.first(items: [
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст"),
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст"),
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст"),
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст"),
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст"),
                                        .init(image: UIImage(named: "123.jpg"), title: "Текст")
                                    ])]),
            .ToggleableSection(title: "Категория 2",
                               items: [.second(items: [.init(image: UIImage(named: "123.jpg"), title: "Текст 2")])]),
            .StepperableSection(title: "Категория 3",
                                items: [.third(items: [.init(image: UIImage(named: "123.jpg"), title: "Текст3")])])
        ]
        self.dataSource.accept(sections)
    }
}

extension MainViewModel {
    
    struct EventItems {
        let image: UIImage?
        let title: String
    }
    
    enum SectionModel {
        case ImageProvidableSection(title: String, items: [SectionItem])
        case ToggleableSection(title: String, items: [SectionItem])
        case StepperableSection(title: String, items: [SectionItem])
    }

    enum SectionItem {
        case first(items: [EventItems])
        case second(items: [EventItems])
        case third(items: [EventItems])
    }
}

// MARK: - SectionModelType
extension MainViewModel.SectionModel: SectionModelType {
    typealias Item = MainViewModel.SectionItem
    
    var items: [MainViewModel.SectionItem] {
        switch  self {
        case .ImageProvidableSection(title: _, items: let items):
            return items
        case .StepperableSection(title: _, items: let items):
            return items
        case .ToggleableSection(title: _, items: let items):
            return items
        }
    }
    
    init(original: MainViewModel.SectionModel, items: [Item]) {
        switch original {
        case let .ImageProvidableSection(title: title, items: _):
            self = .ImageProvidableSection(title: title, items: items)
        case let .StepperableSection(title, _):
            self = .StepperableSection(title: title, items: items)
        case let .ToggleableSection(title, _):
            self = .ToggleableSection(title: title, items: items)
        }
    }
}

extension MainViewModel.SectionModel {
    var title: String {
        switch self {
        case .ImageProvidableSection(title: let title, items: _):
            return title
        case .StepperableSection(title: let title, items: _):
            return title
        case .ToggleableSection(title: let title, items: _):
            return title
        }
    }
}
