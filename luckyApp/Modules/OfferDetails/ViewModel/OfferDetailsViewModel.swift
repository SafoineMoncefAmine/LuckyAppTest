//
//  OfferDetailsViewModel.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

class OfferDetailsViewModel {
    
    // MARK: Properties - public
    let service: OfferDetailsServiceProtocol
    
    // MARK: Methodes - inits
    init(service: OfferDetailsServiceProtocol) {
        self.service = service
    }
    
    // MARK: Methodes - public
    
    func loadOfferDetails(offerID: Int) {
        self.service.offreDetails(id: offerID) { (results) in
            print(results)
        }
    }
}
