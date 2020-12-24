//
//  OffresViewModel.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 24/12/2020.
//

import Foundation

class OffresViewModel {
    
    // MARK: Properties - private
    
    private let service = LuckyService()
    
    // MARK: Methodes
    
    func loadOffres() {
        self.service.offres { (result) in
            print(result)
        }
    }
}
