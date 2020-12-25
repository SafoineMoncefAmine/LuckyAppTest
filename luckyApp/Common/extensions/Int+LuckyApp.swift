//
//  Int+LuckyApp.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

extension Int {
    func shortPresentation() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        switch num {
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)M"
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)K"
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
        }
    }
}
