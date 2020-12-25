//
//  LuckyService.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import Alamofire

class LuckyService {
    
    func offres(completion: @escaping (AFResult<Offers>) -> Void) {
        let router = LuckyRouter.offers
        AF.request(router).responseDecodable { (response: DataResponse<Offers, AFError>) in
            completion(response.result)
        }
    }
}