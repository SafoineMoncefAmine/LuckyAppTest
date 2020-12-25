//
//  ViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import UIKit

class OffresViewController: UIViewController, StoryboardBased {
    
    // MARK: Properties - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Properties - public
    
    var viewModel: OffresViewModel!
        
    // MARK: Properties - private
    
    var data: OfferMetaData?
    
    // MARK: Methodes - VC lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.registerCell(name: OfferCollectionViewCell.className)
        self.viewModel.loadOffres { (offers) in
            self.data = offers
            self.collectionView.reloadData()
        }
    }
}

extension OffresViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let data = self.data else {return 0}
        return data.sections.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = self.data else {return 0}
        if section == 0 {
            return 0
        } else {
            return data.sections[section - 1].items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.className, for: indexPath) as? OfferCollectionViewCell else { return UICollectionViewCell() }
            let cellData = self.data?.sections[0].items[0]
            cell.data = cellData
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.className, for: indexPath) as? OfferCollectionViewCell else { return UICollectionViewCell() }
            let cellData = self.data?.sections[0].items[0]
            cell.data = cellData
            return cell
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, topHeader indexPath: IndexPath, with data: OfferCellMetaData) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.className, for: indexPath) as? OfferCollectionViewCell else { return UICollectionViewCell() }
        let cellData = self.data?.sections[0].items[0]
        cell.data = cellData
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, offerViewCellForRowAt indexPath: IndexPath, with data: OfferCellMetaData) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.className, for: indexPath) as? OfferCollectionViewCell else { return UICollectionViewCell() }
        let cellData = self.data?.sections[0].items[0]
        cell.data = cellData
        return cell
    }
}
