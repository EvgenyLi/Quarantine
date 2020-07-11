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
            .ImageProvidableSection(title: "Section 1",
                items: [.ImageSectionItem(image: UIImage(named: "test")!, title: "General")]),
            .ToggleableSection(title: "Section 2",
                items: [.ToggleableSectionItem(title: "On", enabled: true)]),
            .StepperableSection(title: "Section 3",
                items: [.StepperSectionItem(title: "1")])
        ]
        self.dataSource.accept(sections)
    }
}

extension MainViewModel {
    enum SectionModel {
        case ImageProvidableSection(title: String, items: [SectionItem])
        case ToggleableSection(title: String, items: [SectionItem])
        case StepperableSection(title: String, items: [SectionItem])
    }

    enum SectionItem {
        case ImageSectionItem(image: UIImage, title: String)
        case ToggleableSectionItem(title: String, enabled: Bool)
        case StepperSectionItem(title: String)
    }
}

// MARK: - SectionModelType
extension MainViewModel.SectionModel: SectionModelType {
    typealias Item = MainViewModel.SectionItem
    
    var items: [MainViewModel.SectionItem] {
        switch  self {
        case .ImageProvidableSection(title: _, items: let items):
            return items.map { $0 }
        case .StepperableSection(title: _, items: let items):
            return items.map { $0 }
        case .ToggleableSection(title: _, items: let items):
            return items.map { $0 }
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
