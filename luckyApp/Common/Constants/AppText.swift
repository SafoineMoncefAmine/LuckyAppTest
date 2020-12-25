//
//  AppText.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

public enum AppText: String {
    
    // MARK: NavBar
    
    case offers_count_K, offers_count_description
    
    public func value() -> String {
        return self.rawValue.localized
    }
}
