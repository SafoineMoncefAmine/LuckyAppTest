//
//  AppColors.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation
import UIKit

public enum AppColor: String, CaseIterable {
    static let rgbDividend: CGFloat = 255
    
    case grayscale800, grayscale600, grayscale500, grayscale200
        
    public func value() -> UIColor {
        switch self {
        case .grayscale800:
            return UIColor(red: 34 / AppColor.rgbDividend, green: 45 / AppColor.rgbDividend, blue: 52 / AppColor.rgbDividend, alpha: 1)
        case .grayscale600:
            return UIColor(red: 113 / AppColor.rgbDividend, green: 136 / AppColor.rgbDividend, blue: 151 / AppColor.rgbDividend, alpha: 1)
        case .grayscale500:
            return UIColor(red: 157 / AppColor.rgbDividend, green: 176 / AppColor.rgbDividend, blue: 189 / AppColor.rgbDividend, alpha: 1)
        case .grayscale200:
            return UIColor(red: 247 / AppColor.rgbDividend, green: 249 / AppColor.rgbDividend, blue: 250 / AppColor.rgbDividend, alpha: 1)
        }
    }
}
