//
//  LuckyService.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import Alamofire

class LuckyService {
    private init() {}
    static let shared = LuckyService()
}

extension LuckyService: OffersServiceProtocol {
    func offres(completion: @escaping (AFResult<Offers>) -> Void) {
        let router = LuckyRouter.offers
        AF.request(router).responseDecodable { (response: DataResponse<Offers, AFError>) in
            completion(response.result)
        }
    }
}

extension LuckyService: OfferDetailsServiceProtocol {
    func offreDetails(id: Int, completion: @escaping (AFResult<OfferDetails>) -> Void) {
        let router = LuckyRouter.offerDetails(id: id)
        AF.request(router).responseDecodable { (response: DataResponse<OfferDetails, AFError>) in
            completion(response.result)
        }
    }
}
