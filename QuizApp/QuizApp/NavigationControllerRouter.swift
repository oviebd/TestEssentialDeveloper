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


class NavigationControllerRouter : Router {
    
//    typealias Answer = String
//    typealias Question = Question<String>
    
    private let navigationController : UINavigationController
    private let factory : ViewControllerFactory
    
    init(navigationController: UINavigationController, factory : ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: Question<String>, answerCallback: @escaping ([String]) -> Void) {
        show(factory.questionVC(for: question, answerCallback: answerCallback))
    }
   
    func routeTo(result: Result<Question<String>, [String]>) {
        show(factory.resultVC(for: result))
       
    }
    
    private func show(_ uiVewController : UIViewController){
        navigationController.pushViewController(uiVewController, animated: true)
    }
    
}
