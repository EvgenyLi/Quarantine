//
//  EventView.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 08.07.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxDataSources

public final class EventView: UIView {
    
    private var items: [EventCell.ViewState] = []
    
    private let cv: UICollectionView = {
        let cvfl = UICollectionViewFlowLayout()
        cvfl.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvfl)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .blue
        cv.register(class: EventCell.self)
        setupLayout()
        cv.delegate = self
        cv.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(cv)
        cv.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cv.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

extension EventView {
    public struct ViewState {
        public var items: [EventCell.ViewState]
    }
    
    public func render(state: ViewState) {
        items = state.items
    }
}

extension EventView: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EventCell = cv.dequeueReusableCell(for: indexPath)
        cell.render(items[indexPath.item])
        return cell
    }
    
    
}


extension EventView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
}
