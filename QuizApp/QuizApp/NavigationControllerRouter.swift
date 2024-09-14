//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Habibur Rahman on 10/9/24.
//

import Foundation
import QuizEngine
import UIKit



let question = Question.singleAnswer("A question?")

protocol ViewControllerFactory {
    func questionVC(for question : String, answerCallback : @escaping (String) -> Void) -> UIViewController
}

class NavigationControllerRouter : Router {
    
    typealias Answer = String
    typealias Question = String
    
    private let navigationController : UINavigationController
    private let factory : ViewControllerFactory
    
    init(navigationController: UINavigationController, factory : ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        let vc = factory.questionVC(for: question, answerCallback: answerCallback)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
    
}
