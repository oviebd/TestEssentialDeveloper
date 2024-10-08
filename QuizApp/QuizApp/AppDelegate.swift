//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Habibur Rahman on 18/8/24.
//

import UIKit
import QuizEngine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = QuestionViewController(question: "A question", options: ["A", "B"], selection: {
//            print($0)
//        })

        let answers = [
        PresentableAnswer(question: "Question QuestionQuestionQuestionQuestionQuestionQuestion Question", answer: "Answer AnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswer AnswerAnswer end", wrongAnswer: nil),
        PresentableAnswer(question: "Q2", answer: "A2", wrongAnswer: "Wrong")
        ]
        let vc = ResultsViewController(summary: "you got 1/2 cirrect", answers: answers)
//        let vc = QuestionViewController(question: "A question", options: ["A", "B"], selection: {
//            print($0)
//        })
        _ = vc.view
        vc.tableView.allowsMultipleSelection = true
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
        
     
    }
}
