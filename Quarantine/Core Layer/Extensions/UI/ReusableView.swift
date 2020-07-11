//
//  ReusableView.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 07.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

#if os(iOS)

import UIKit

/// Ререиспользуемое View, например в UITableView или UICollectionView.
public protocol ReusableView: class {}

extension ReusableView where Self: UIView {

    /// Идентификатор для реиспользования. Совпадает с названием класса.
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableView {}
extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}

#endif

