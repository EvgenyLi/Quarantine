//
//  EventCell.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 01.08.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit

public final class EventCell: UICollectionViewCell {
    
    private var image: UIImageView = {
        let image = UIImageView()
        //image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let _stack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(_stack)
        _stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        _stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        _stack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        _stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        contentView.addSubview(image)
//        contentView.addSubview(label)
//        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
}

extension EventCell {
    public struct ViewState {
        let image: UIImage?
        let title: String
    }
    
    public func render(_ viewState: EventCell.ViewState) {
        self.image.image = viewState.image
        self.label.text = viewState.title
        [image, label].forEach(_stack.addArrangedSubview)
    }
}
