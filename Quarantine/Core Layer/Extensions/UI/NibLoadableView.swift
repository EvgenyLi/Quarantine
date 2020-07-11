//
//  NibLoadableView.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 07.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

#if os(iOS)

import UIKit

/// View загружаемое из .xib файлов.
public protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {

    /// Имя файла view. Совпадает с названием класса.
    public static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: NibLoadableView {}
extension UITableViewCell: NibLoadableView {}
extension UITableViewHeaderFooterView: NibLoadableView {}

#endif
