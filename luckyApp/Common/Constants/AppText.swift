//
//  AppText.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

public enum AppText: String {
    
    // MARK: NavBar
    
    case offers_title, offers_count_K, offers_count_description
    
    case offer_details_price, offer_details_redemptions
    
    public func value() -> String {
        return self.rawValue.localized
    }
}
