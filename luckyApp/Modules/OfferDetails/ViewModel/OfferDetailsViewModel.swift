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
                let offerPrice = OfferDetailPriceInfoData(title: AppText.offer_details_price.value(),
                                                          oldPrice: value.price.old,
                                                          newPrice: value.price.new,
                                                          expirationDate: value.expiration)
                let data = OfferDetailsMetaData(imageURL: url,
                                                infos: offerInfos,
                                                priceData: offerPrice)
                completion(data)
            case .failure:
                print("error")
            }

        }
    }
}
