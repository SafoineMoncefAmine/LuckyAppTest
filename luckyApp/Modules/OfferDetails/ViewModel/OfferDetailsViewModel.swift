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
    var offerID: Int
    
    // MARK: Methodes - inits
    
    init(offerID: Int, service: OfferDetailsServiceProtocol) {
        self.service = service
        self.offerID = offerID
    }
    
    // MARK: Methodes - public
    
    func loadOfferDetails() {
        self.service.offreDetails(id: self.offerID) { (results) in
            print(results)
        }
    }
}
