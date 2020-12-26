//
//  OfferDetailsViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferDetailsViewController: UIViewController, StoryboardBased {

    // MARK: Properties - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties - public
    
    var viewModel: OfferDetailsViewModel!
    
    // MARK: Methodes - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.viewModel.loadOfferDetails()
    }
}

extension OfferDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
