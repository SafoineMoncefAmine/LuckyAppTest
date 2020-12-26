//
//  LuckyServiceProtocoles.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Alamofire

protocol OffersServiceProtocol {
    func offres(completion: @escaping (AFResult<Offers>) -> Void)
}

protocol OfferDetailsServiceProtocol {
    func offreDetails(completion: @escaping (AFResult<Offers>) -> Void)
}
