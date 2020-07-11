//
//  EventView.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 08.07.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit

public final class EventView: UIView {
    
    let title = UILabel()
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventView {
    public struct ViewState {
        public var title: String
    }
    
    public func render(state: ViewState) {
        title.text = state.title
    }
}
