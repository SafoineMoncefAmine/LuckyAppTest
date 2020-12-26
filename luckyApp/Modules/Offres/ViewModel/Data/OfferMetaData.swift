//
//  OfferMetaData.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

struct OfferMetaData {
    let title: String
    let offersCount: String
    let sections: [OfferSectionMetaData] // here the Key represents Section Title
}

struct OfferSectionMetaData {
    let title: String
    let items: [OfferCellMetaData]
}
