//
//  StoryboardBased.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import Foundation

import UIKit

protocol StoryboardBased: class {
    static var storyboard: UIStoryboard { get }
    static func instanciate() -> Self
}

extension StoryboardBased where Self: UIViewController {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: nil)
    }
    
    static func instanciate() -> Self {
        guard let viewController = self.storyboard.instantiateInitialViewController() as? Self else {
            fatalError("The initial ViewController of storyboard \(storyboard) is not of the expected class \(Self.self)")
        }
        return viewController
    }
    
    static func instanciateInNavigationController() -> UINavigationController {
        let viewController = Self.instanciate()
        let navigationController = UINavigationController()
        
        navigationController.setViewControllers([viewController], animated: false)

        return navigationController
    }
}
