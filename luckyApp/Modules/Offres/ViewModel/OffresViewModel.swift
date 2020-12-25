//
//  OffresViewModel.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import Foundation

class OffresViewModel {
    
    // MARK: Properties - private
    
    private let service = LuckyService()
    
    // MARK: Methodes
    
    func loadOffres(completion: @escaping (OfferMetaData) -> Void) {
        self.service.offres { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let value):
                completion(strongSelf.buildOfferMetaData(offers: value))
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    private func buildOfferMetaData(offers: Offers) -> OfferMetaData {
        let offersCountDescription: String
        let offerTitle: String
        var offerSections: [OfferSectionMetaData]
        
        offersCountDescription = "\(offers.sections.reduce(0, {$0 + $1.items.count})) " + AppText.offers_count_description.value()
        offerTitle = offers.title
        offerSections = []
        
        for section in offers.sections {
            offerSections.append(buildOfferCellMetaData(from: section))
        }
        
        return OfferMetaData(status: .finish,
                             title: offerTitle,
                             offersCount: offersCountDescription,
                             sections: offerSections)
    }
    
    private func buildOfferCellMetaData(from section: Section) -> OfferSectionMetaData {
        var items: [OfferCellMetaData] = []
        
        for item in section.items {
            let itemUrl = URL(string: item.imageURL.replacingOccurrences(of: "w=1125&h=750", with: "w=120&h=80")) // this is a bad practice normally we must get w=1125&h=750 from the server or we get URL without it and we set it from front
            let title = item.brand
            let description = item.title
            let tag = item.tags ?? ""
            let favoriteCount = item.favoriteCount.shortPresentation()
            let favIcon = AppImage.ic_favorited
            items.append(OfferCellMetaData(imageUrl: itemUrl,
                                           title: title,
                                           description: description,
                                           tag: tag,
                                           favoritesIcon: favIcon,
                                           favoritesCount: favoriteCount))
        }
        return OfferSectionMetaData(title: section.title, items: items)
    }
}
