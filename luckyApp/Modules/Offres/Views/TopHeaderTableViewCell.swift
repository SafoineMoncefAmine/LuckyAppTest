//
//  TopHeaderTableViewCell.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 25/12/2020.
//

import UIKit

class TopHeaderTableViewCell: UITableViewCell {

    // MARK: Properties - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Properties - public
    
    var data: String? {
        didSet {
            self.affectData()
        }
    }
    
    // MARK: - Properties - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Methodes - Handlers
    
    private func setupUI() {
        self.titleLabel.textColor = AppColor.grayscale600.value()
        self.titleLabel.font = AppFont.sfProText.value(size: 14)
    }
    
    private func affectData() {
        self.titleLabel.text = data
    }
}
