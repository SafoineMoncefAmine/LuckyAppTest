//
//  AppImage.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

public enum AppImage: String {
    
    // MARK: Offers
    
    case ic_favorited
    
    // MARK: Offers Details
    
    case ic_share, ic_add_favorite
    
    public func value() -> UIImage? {
        let image = UIImage(named: self.rawValue)
        return image
    }
}
