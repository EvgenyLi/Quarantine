//
//  UITableView.swift
//  Quarantine
//
//  Created by Lipadat Evgeniy on 07.06.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

#if os(iOS)

import UIKit

// MARK: - Регистрация и dequeue для UITableViewCell
public extension UITableView {

    /// Регистрирует ячейку по ее классу, наследнику ячейки UITableViewCell.
    func register<T: UITableViewCell>(class _: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    /// Регистрирует nib по классу наследнику ячейки UITableViewCell.
    func register<T: UITableViewCell>(_: T.Type) {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: T.self)), forCellReuseIdentifier: T.reuseIdentifier)
    }

    /// Возвращает объект ячейки по классу наследнику ячейки UITableViewCell.
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

// MARK: - Регистрация и dequeue для UITableViewHeaderFooterView
public extension UITableView {

    /// Регистрирует nib для section header/footer по классу наследнику view UITableViewHeaderFooterView.
    func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: T.self)), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    /// Регистрирует section header/footer по классу.
    func register<T: UITableViewHeaderFooterView>(class _: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    /// Возвращает объект section header/footer по классу наследнику ячейки UITableViewHeaderFooterView.
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue section header/footer with identifier: \(T.reuseIdentifier)")
        }
        return headerFooter
    }
}

#endif

