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
    
    func loadOfferDetails(completion: @escaping (OfferDetailsMetaData) -> Void) {
        self.service.offreDetails(id: self.offerID) { (results) in
            switch results {
            case .success(let value):
                let data = self.buildOfferDetailsData(offer: value)
                completion(data)
            case .failure(let error):
                log.error(error.errorDescription)
            }
        }
    }
    
    private func buildOfferDetailsData(offer: OfferDetails) -> OfferDetailsMetaData {
        let url = URL(string: offer.imageURL)
        let offerInfos = OfferDetailContentInfosData(topTitle: offer.brand,
                                                     topRightIcon: AppImage.ic_favorited,
                                                     topRightFavText: offer.favoriteCount.shortPresentation(),
                                                     middleTitle: offer.title,
                                                     bottomDescription: offer.offerDetailsDescription)
        let offerPrice = OfferDetailPriceInfoData(oldPrice: offer.price.old,
                                                  newPrice: offer.price.new,
                                                  expirationDate: offer.expiration)
        
        let redemptionText = AppText.offer_details_redemptions.value() + offer.redemptionsCap
        let data = OfferDetailsMetaData(imageURL: url,
                                        infos: offerInfos,
                                        priceData: offerPrice,
                                        redemptionText: redemptionText)
        return data
    }
}
