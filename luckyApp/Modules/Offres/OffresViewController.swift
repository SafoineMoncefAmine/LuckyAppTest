//
//  ViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import UIKit

class OffresViewController: UIViewController, StoryboardBased {
    
    // MARK: Properties - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties - public
    
    var viewModel: OffresViewModel!
        
    // MARK: Properties - private
    
    var data: OfferMetaData?
    
    // MARK: Methodes - VC lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.setuUI()
        self.viewModel.loadOffres { (offers) in
            self.data = offers
            self.tableView.reloadData()
        }
    }
    
    // MARK: Methodes -
    
    private func setuUI() {
        self.tableView.separatorStyle = .none
    }
    
    private func configure() {
        self.tableView.dataSource = self
        self.tableView.registerCell(name: OfferTableViewCell.className)
    }
}

extension OffresViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = self.data else {return 0}
        return data.sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.data else {return 0}
        if section == 0 {
            return 0
        } else {
            return data.sections[section - 1].items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.className, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
            let cellData = self.data?.sections[0].items[0]
            cell.data = cellData
            return cell
        } else {
            let cellData = self.data?.sections[indexPath.section - 1].items[indexPath.row]
            return self.tableView(tableView, offerViewCellForRowAt: indexPath, with: cellData)
        }
    }
        private func tableView(_ tableView: UITableView, topHeader indexPath: IndexPath, with data: OfferCellMetaData) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.className, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
            cell.data = data
            return cell
        }
    
        private func tableView(_ tableView: UITableView, offerViewCellForRowAt indexPath: IndexPath, with data: OfferCellMetaData?) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.className, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
            cell.data = data
            return cell
        }
}
