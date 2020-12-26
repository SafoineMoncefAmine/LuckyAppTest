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
                guard let url = URL(string: value.imageURL) else {
                    return
                }
                let offerInfos = OfferDetailContentInfosData(topTitle: value.brand,
                                                             topRightIcon: AppImage.ic_favorited,
                                                             topRightFavText: value.favoriteCount.shortPresentation(),
                                                             middleTitle: value.title,
                                                             bottomDescription: value.offerDetailsDescription)
                let offerPrice = OfferDetailPriceInfoData(oldPrice: value.price.old,
                                                          newPrice: value.price.new,
                                                          expirationDate: value.expiration)
                
                let redemptionText = AppText.offer_details_redemptions.value() + value.redemptionsCap
                let data = OfferDetailsMetaData(imageURL: url,
                                                infos: offerInfos,
                                                priceData: offerPrice,
                                                redemptionText: redemptionText)
                completion(data)
            case .failure:
                print("error")
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
