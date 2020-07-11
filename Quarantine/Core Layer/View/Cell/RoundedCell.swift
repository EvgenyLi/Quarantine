//
//  RoundedCell.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 08.07.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public final class RoundedCell: UITableViewCell {
    
    private let _eventView = EventView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(_eventView)
        _eventView.translatesAutoresizingMaskIntoConstraints = false
        _eventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        _eventView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        _eventView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        _eventView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RoundedCell {
    public func render(_ viewState: EventView.ViewState) {
        _eventView.render(state: viewState)
    }
}
