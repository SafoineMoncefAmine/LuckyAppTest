//
//  OfferDetailsViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import UIKit

class OfferDetailsViewController: UIViewController, StoryboardBased {

    // MARK: Properties - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties - public
    
    var viewModel: OfferDetailsViewModel!
    var data: OfferDetailsMetaData?
    
    // MARK: Methodes - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.viewModel.loadOfferDetails { (data) in
            self.data = data
            self.tableView.reloadData()
        }
    }
    
    // MARK: Methodes - private - setups
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.registerCell(name: OfferImageTableViewCell.className)
    }
}

// MARK: - UITableViewDataSource

extension OfferDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let offerImageURL = self.data?.imageURL
        return self.tableView(tableView, offerImageCellForRowAt: indexPath, with: offerImageURL)
    }
    
    // MARK: tableview cell creation
    
    private func tableView(_ tableView: UITableView, offerImageCellForRowAt indexPath: IndexPath, with data: URL?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferImageTableViewCell.className, for: indexPath) as? OfferImageTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
}
