//
//  AppFont.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

public enum AppFont: String {
        
    case sfProText = "SFProText-Regular"
    
    // MARK: Methods - internal - utilities
    
    public func value(size: Int = 17) -> UIFont {
        guard let customFont = UIFont(name: self.rawValue, size: CGFloat(size)) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
}
