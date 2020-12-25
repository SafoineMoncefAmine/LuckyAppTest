//
//  String+LuckyApp.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
