//
//  ViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import UIKit

class OffresViewController: UIViewController, StoryboardBased {
    
    var viewModel: OffresViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.loadOffres { (offers) in
            print(offers)
        }
    }
}
