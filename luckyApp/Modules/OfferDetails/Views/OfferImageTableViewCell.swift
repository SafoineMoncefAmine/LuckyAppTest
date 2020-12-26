//
//  OfferImageTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit
import SDWebImage

class OfferImageTableViewCell: UITableViewCell {
    
    // MARK: Properties - Outlets
    
    @IBOutlet private weak var offerImageView: UIImageView!
    
    // MARK: Properties - public
    
    var data: URL? {
        didSet {
            self.offerImageView.sd_setImage(with: self.data, completed: nil)
        }
    }
    
    // MARK: Methodes - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
