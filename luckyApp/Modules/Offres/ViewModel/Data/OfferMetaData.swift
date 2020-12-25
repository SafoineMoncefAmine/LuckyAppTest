//
//  OfferMetaData.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import Foundation

struct OfferMetaData {
    enum Status {
        case quiet, loading, finish
    }
    let status: Status
    let title: String
    let offersCount: String
    let sections: [String: [OfferCellMetaData]] // here the Key represents Section Title
}
