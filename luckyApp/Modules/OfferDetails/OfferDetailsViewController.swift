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
        self.tableView.registerCell(name: OfferContentInfosTableViewCell.className)
        self.tableView.registerCell(name: OfferPriceTableViewCell.className)
        self.tableView.registerCell(name: OfferRedemptionsTableViewCell.className)
    }
}

// MARK: - UITableViewDataSource

extension OfferDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let offerImageURL = self.data?.imageURL
            return self.tableView(tableView, offerImageCellForRowAt: indexPath, with: offerImageURL)
        } else if indexPath.row == 1 {
            let offerInfos = self.data?.infos
            return self.tableView(tableView, offerInfosCellForRowAt: indexPath, with: offerInfos)
        } else if indexPath.row == 2 {
            let offerPricesInfos = self.data?.priceData
            return self.tableView(tableView, offerPricesInfosCellForRowAt: indexPath, with: offerPricesInfos)
        } else if indexPath.row == 3  {
            let redemtionData = self.data?.redemptionText
            return self.tableView(tableView, redemptionInfosCellForRowAt: indexPath, with: redemtionData)
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: tableview cell creation
    
    private func tableView(_ tableView: UITableView, offerImageCellForRowAt indexPath: IndexPath, with data: URL?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferImageTableViewCell.className, for: indexPath) as? OfferImageTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
    
    private func tableView(_ tableView: UITableView, offerInfosCellForRowAt indexPath: IndexPath, with data: OfferDetailContentInfosData?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferContentInfosTableViewCell.className, for: indexPath) as? OfferContentInfosTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
    
    private func tableView(_ tableView: UITableView, offerPricesInfosCellForRowAt indexPath: IndexPath, with data: OfferDetailPriceInfoData?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferPriceTableViewCell.className, for: indexPath) as? OfferPriceTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
    
    private func tableView(_ tableView: UITableView, redemptionInfosCellForRowAt indexPath: IndexPath, with data: String?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferRedemptionsTableViewCell.className, for: indexPath) as? OfferRedemptionsTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
}
