//
//  OfferRedemptionsTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferRedemptionsTableViewCell: UITableViewCell {
    
    // MARK: Properties - Outlets
    
    @IBOutlet private weak var redemptionLabel: UILabel!
    
    // MARK: Properties - public
    
    var data: String? {
        didSet {
            self.redemptionLabel.text = data?.uppercased()
        }
    }
    
    // MARK: Methodes - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: Methodes - priavate - setup
    
    private func setupUI() {
        self.redemptionLabel.textColor = AppColor.grayscale800.value()
        self.redemptionLabel.font = AppFont.SFProTextMedium.value(size: 12)
    }
}
