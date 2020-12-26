//
//  OfferContentInfosTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferContentInfosTableViewCell: UITableViewCell {
    
    // MARK: Properties - Outlets
    
    @IBOutlet private weak var brandLabel: UILabel!
    @IBOutlet private weak var favIconImageView: UIImageView!
    @IBOutlet private weak var favoriteCountLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: Properties - public
    
    var data: OfferDetailContentInfosData? {
        didSet {
            self.affectData()
        }
    }
    
    // MARK: Methodes - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: Methodes - private - handlers
    
    private func affectData() {
        guard let data = self.data else { return }
        self.brandLabel.text = data.topTitle.uppercased()
        self.favIconImageView.image = data.topRightIcon.value()
        self.favoriteCountLabel.text = data.topRightFavText
        self.descriptionLabel.text = data.bottomDescription
        self.titleLabel.text = data.middleTitle
    }
    
    private func setupUI() {
        self.brandLabel.textColor = AppColor.grayscale600.value()
        self.brandLabel.font = AppFont.sfProTextRegular.value(size: 12)
        
        self.favoriteCountLabel.textColor = AppColor.grayscale600.value()
        self.favoriteCountLabel.font = AppFont.sfProTextRegular.value(size: 12)
        
        self.titleLabel.textColor = AppColor.grayscale800.value()
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = AppFont.SFProTextMedium.value(size: 32)
        
        self.descriptionLabel.textColor = AppColor.grayscale800.value()
        self.descriptionLabel.font = AppFont.SFProTextLight.value(size: 16)
    }
}
