//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Habibur Rahman on 18/8/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = QuestionViewController(question: "A question", options: ["A", "B"], selection: {
//            print($0)
//        })

        let vc = QuestionViewController(question: "A question", options: ["A", "B"], selection: {
            print($0)
        })
        _ = vc.view
        vc.tableView.allowsMultipleSelection = true
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
