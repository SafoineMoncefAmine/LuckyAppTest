//
//  OfferDetailsViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferDetailsViewController: UIViewController, StoryboardBased {

    // MARK: Properties - public
    
    var viewModel: OfferDetailsViewModel!
    
    // MARK: Methodes - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.loadOfferDetails(offerID: 1)
    }
}
