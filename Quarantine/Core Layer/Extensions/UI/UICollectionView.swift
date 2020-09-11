//
//  UICollectionView.swift
//  Quarantine
//
//  Created by Evgeny Lipadat on 01.08.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit

// MARK: - Регистрация и dequeue для UICollectionViewCell
public extension UICollectionView {

    /// Регистрирует ячейку по ее классу, наследнику ячейки UICollectionViewCell.
    func register<T: UICollectionViewCell>(class _: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    /// Регистрирует nib по классу наследнику ячейки UICollectionViewCell.
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: T.self)), forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    /// Возвращает объект ячейки по классу наследнику ячейки UICollectionViewCell.
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
