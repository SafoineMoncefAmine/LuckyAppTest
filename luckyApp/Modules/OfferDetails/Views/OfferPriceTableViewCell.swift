//
//  OfferPriceTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferPriceTableViewCell: UITableViewCell {
    
    // MARK: Properties - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var oldPriceLabel: UILabel!
    @IBOutlet private weak var newPriceLabel: UILabel!
    @IBOutlet private weak var expirationDateLabel: UILabel!
    @IBOutlet private weak var oldPriceStrikeLine: UIView!
    
    // MARK: Properties - public
    
    var data: OfferDetailPriceInfoData? {
        didSet {
            self.affectData()
        }
    }
    
    // MARK: Methodes - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: Methodes - Handlers
    
    private func affectData() {
        guard let data = self.data else { return }
        self.titleLabel.text = data.title
        self.oldPriceLabel.text = data.oldPrice
        self.newPriceLabel.text = data.newPrice
        self.expirationDateLabel.text = data.expirationDate
    }
    
    private func setupUI() {
        self.titleLabel.textColor = AppColor.grayscale800.value()
        self.titleLabel.font = AppFont.sfProTextRegular.value(size: 10)
        
        self.oldPriceLabel.textColor = AppColor.grayscale500.value()
        self.oldPriceStrikeLine.backgroundColor = AppColor.grayscale500.value()
        self.oldPriceLabel.font = AppFont.sfProTextRegular.value(size: 14)
        
        self.newPriceLabel.textColor = AppColor.grayscale800.value()
        self.newPriceLabel.font = AppFont.SFProTextMedium.value(size: 18)
        
        self.expirationDateLabel.textColor = AppColor.grayscale600.value()
        self.expirationDateLabel.font = AppFont.sfProTextRegular.value(size: 10)
    }
}
