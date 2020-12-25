//
//  OfferCollectionViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties - Outlets
    
    @IBOutlet private weak var offerImageView: UIImageView!
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var centerLabel: UILabel!
    @IBOutlet private weak var bottomLabel: UILabel!
    
    @IBOutlet private weak var favIconImageView: UIImageView!
    @IBOutlet private weak var favLabel: UILabel!
    
    // MARK: - Properties - public
    
    var data: OfferCellMetaData? {
        didSet {
            self.affectData()
        }
    }
    
    // MARK: Methodes - Handlers
    
    private func affectData() {
        guard let data = self.data else { return }
        
        self.topLabel.text = data.title
        self.centerLabel.text = data.description
        self.bottomLabel.text = data.tag
        self.favIconImageView.image = data.favoritesIcon.value()
        self.favLabel.text = "\(data.favoritesCount)"
    }
}
