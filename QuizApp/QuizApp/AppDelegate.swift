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
    let window = UIWindow (frame: UIScreen.main.bounds)
    window.rootViewController = QuestionViewController()
    window.makeKeyAndVisible()
    self.window = window
    return true
    }

}

