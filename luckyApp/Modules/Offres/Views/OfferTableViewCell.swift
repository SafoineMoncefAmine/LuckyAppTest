//
//  OfferTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

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
    
    // MARK: - Methodes - lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Methodes - Handlers
    
    private func affectData() {
        guard let data = self.data else { return }
        
        self.topLabel.text = data.title
        self.centerLabel.text = data.description
        self.bottomLabel.text = data.tag
        self.favIconImageView.image = data.favoritesIcon.value()
        self.favLabel.text = "\(data.favoritesCount)"
        
    }
    
    func setupUI() {
        self.topLabel.textColor = AppColor.grayscale600.value()
        self.topLabel.font = AppFont.sfProText.value(size: 10)
        
        self.centerLabel.textColor = AppColor.grayscale800.value()
        self.centerLabel.numberOfLines = 0
        self.centerLabel.font = AppFont.sfProText.value(size: 16)
        
        self.bottomLabel.textColor = AppColor.grayscale600.value()
        self.bottomLabel.font = AppFont.sfProText.value(size: 10)
        
        self.favLabel.textColor = AppColor.grayscale600.value()
        self.favLabel.font = AppFont.sfProText.value(size: 10)
    }
}
