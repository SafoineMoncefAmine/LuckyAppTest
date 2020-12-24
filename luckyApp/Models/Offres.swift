//
//  Offres.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import Foundation

// MARK: - Offers
struct Offers: Codable {
    let title: String
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let title: String
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let detailURL, imageURL: String
    let brand, title: String
    let tags: String?
    let favoriteCount: Int

    enum CodingKeys: String, CodingKey {
        case detailURL = "detailUrl"
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
    }
}
