//
//  ViewController.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import UIKit

class OffresViewController: UIViewController, StoryboardBased {
    let service = LuckyService()
    override func viewDidLoad() {
        super.viewDidLoad()
        service.offres { result in
            switch result {
            case .success(let offers):
                print(offers)
            case .failure(let error):
                print(error)
            }
        }
    }
}
