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
        log.info()
        self.setupTableView()
        self.setupUI()
        self.setupNavigationController()
        self.viewModel.loadOffres { (offers) in
            self.data = offers
            self.tableView.reloadData()
        }
    }
    
    deinit {
        log.info()
    }
    
    // MARK: Methodes - Handlers
    
    private func setupUI() {
        self.tableView.separatorStyle = .none
        self.navigationController?.navigationBar.backgroundColor = AppColor.grayscale200.value()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCell(name: OfferTableViewCell.className)
        self.tableView.registerCell(name: TopHeaderTableViewCell.className)
        self.tableView.registerCell(name: OfferSectionHeaderTableViewCell.className)
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.topItem?.title = AppText.offers_title.value()
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

// MARK: - UITableViewDataSource

extension OffresViewController: UITableViewDataSource {
    
    // MARK: TableView DataSource methodes
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = self.data else {return 0}
        return data.sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.data else {return 0}
        if section == 0 { // NOTE: first section contains only the top header
            return 1
        } else {
            return data.sections[section - 1].items.count + 1 // NOTE: we add 1 for each section header
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // NOTE: this for top header
            return self.tableView(tableView, topHeaderCellForRowAt: indexPath, with: self.data?.offersCount)
        } else if indexPath.row == 0 { // NOTE: this for section header
            let cellData = self.data?.sections[indexPath.section - 1].title
            return self.tableView(tableView, sectionHeaderCellForRowAt: indexPath, with: cellData)
        } else { // NOTE:this for offer cell
            let cellData = self.data?.sections[indexPath.section - 1].items[indexPath.row - 1]
            return self.tableView(tableView, offerViewCellForRowAt: indexPath, with: cellData)
        }
    }
    
    // MARK: tableview cell creation
    
    private func tableView(_ tableView: UITableView, topHeaderCellForRowAt indexPath: IndexPath, with data: String?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopHeaderTableViewCell.className, for: indexPath) as? TopHeaderTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
    
    private func tableView(_ tableView: UITableView, sectionHeaderCellForRowAt indexPath: IndexPath, with data: String?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferSectionHeaderTableViewCell.className, for: indexPath) as? OfferSectionHeaderTableViewCell else { return UITableViewCell() }
        cell.data = data
        return cell
    }
    
    private func tableView(_ tableView: UITableView, offerViewCellForRowAt indexPath: IndexPath, with data: OfferCellMetaData?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.className, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
        cell.data = data
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate

extension OffresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section != 0, indexPath.row != 0 else { return }
        guard let itemID = self.viewModel.getIDForItem(section: indexPath.section - 1, row: indexPath.row - 1) else { // NOTE: reduce 1 for first cells that represent the headers
            // TODO: handle case where offerID is nil
            log.warning("can't find offerID for the selected offer")
            return
        }
        let offerDetailsVC = OfferDetailsViewController.instanciate()
        offerDetailsVC.viewModel = OfferDetailsViewModel(offerID: itemID, service: LuckyService.shared)
        self.navigationController?.pushViewController(offerDetailsVC, animated: true)
    }
}
