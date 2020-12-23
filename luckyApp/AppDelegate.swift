//
//  AppDelegate.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 23/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let mainVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() {
            self.window?.rootViewController = UINavigationController(rootViewController: mainVC)
        }
        return true
    }
}
