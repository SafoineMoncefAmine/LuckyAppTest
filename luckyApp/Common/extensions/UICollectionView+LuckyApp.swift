//
//  UICollectionView+LuckyApp.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

extension UICollectionView {
    
    public func registerCell(name: String) {
        register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
    
    public func registerCell(class cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
}
