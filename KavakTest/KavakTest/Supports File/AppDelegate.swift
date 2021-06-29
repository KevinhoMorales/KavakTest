//
//  AppDelegate.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpInitView()
        setUpPods()
        return true
    }

    private func setUpInitView() {
        let coordinator = MainCoordinator()
        coordinator.homeView()
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator.navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
    }
    
    private func setUpPods() {
        IQKeyboardManager.shared.enable = true
    }

}

