//
//  OfferDetails.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

// MARK: - OfferDetails

struct OfferDetails: Codable {
    let id: Int
    let imageURL: String
    let brand, title, tags: String
    let favoriteCount: Int
    let offerDetailsDescription: String
    let price: Price
    let expiration, redemptionsCap: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
        case offerDetailsDescription = "description"
        case price, expiration, redemptionsCap
    }
}

// MARK: - Price

struct Price: Codable {
    let old, new: String
}
