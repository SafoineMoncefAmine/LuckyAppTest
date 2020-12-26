//
//  OfferDetailsMetaData.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

struct OfferDetailsMetaData {
    let imageURL: URL
    let infos: OfferDetailContentInfosData
    let priceData: OfferDetailPriceInfoData
}

struct OfferDetailContentInfosData {
    let topTitle: String
    let topRightIcon: AppImage
    let topRightFavText: String
    let middleTitle: String
    let bottomDescription: String
}

struct OfferDetailPriceInfoData {
    let title: String
    let oldPrice: String
    let newPrice: String
    let expirationDate: String
}
