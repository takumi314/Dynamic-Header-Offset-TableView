//
//  AppDelegate.swift
//  Dynamic-Header-Offset-TableView
//
//  Created by NishiokaKohei on 2022/10/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 15.0, *) {
            let tabAppearance = UITabBarAppearance()
            tabAppearance.configureWithOpaqueBackground()

            let tabBarAppearance = UITabBarItemAppearance()
            tabBarAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.tintColor]
            tabBarAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.tintColor]
            tabAppearance.stackedLayoutAppearance = tabBarAppearance
            
            UITabBar.appearance().standardAppearance = tabAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        } else {
            // Fallback on earlier versions
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

