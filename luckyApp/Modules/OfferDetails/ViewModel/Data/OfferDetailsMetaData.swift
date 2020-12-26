//
//  OfferDetailsMetaData.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

struct OfferDetailsMetaData {
    let imageURL: URL?
    let infos: OfferDetailContentInfosData
    let priceData: OfferDetailPriceInfoData
    let redemptionText: String
}

struct OfferDetailContentInfosData {
    let topTitle: String
    let topRightIcon: AppImage
    let topRightFavText: String
    let middleTitle: String
    let bottomDescription: String
}

struct OfferDetailPriceInfoData {
    let oldPrice: String
    let newPrice: String
    let expirationDate: String
}
