//
//  UITableView+LuckyApp.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

extension UITableView {

    func registerCell(name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    func registerCell(class cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
}
