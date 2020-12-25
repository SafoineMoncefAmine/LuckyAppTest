//
//  NSObject+LuckyApp.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

extension NSObject {
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return String(describing: type(of: self))
    }
}
