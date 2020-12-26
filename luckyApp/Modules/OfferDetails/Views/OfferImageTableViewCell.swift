//
//  OfferImageTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit
import SDWebImage

class OfferImageTableViewCell: UITableViewCell {

    @IBOutlet weak var offerImageView: UIImageView!
    
    var data: URL? {
        didSet {
            self.offerImageView.sd_setImage(with: self.data, completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
