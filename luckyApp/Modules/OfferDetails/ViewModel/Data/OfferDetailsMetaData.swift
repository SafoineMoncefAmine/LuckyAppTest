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
}

struct OfferDetailContentInfosData {
    let topTitle: String
    let topRightIcon: AppImage
    let topRightFavText: String
    let middleTitle: String
    let bottomDescription: String
}
