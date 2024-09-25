//
//  iOSVCFactory.swift
//  QuizApp
//
//  Created by Habibur Rahman on 20/9/24.
//

import Foundation
import UIKit
import QuizEngine

class iOSVCFactory : ViewControllerFactory {
    
    private let options : [Question<String>:[String]]
    
    init(options: [Question<String> : [String]]) {
        self.options = options
    }
    
    func questionVC(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
        
        guard let options = self.options[question] else{
            fatalError("Could not find options for question \(question)")
        }
    
        return questionVC(for: question, options: options, answerCallback: answerCallback)
       
    }
    
    func questionVC(for question : Question<String>, options:[String], answerCallback : @escaping([String]) -> Void) -> UIViewController{
        
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options, selection: answerCallback)
            
        case .multipleAnswer(let value):
            let controller = QuestionViewController(question: value, options: options, selection: answerCallback)
            _ = controller.view
            controller.tableView.allowsMultipleSelection = true
            return controller
            
        default :
            return UIViewController()
        }
    }
    
    func resultVC(for result: QuizEngine.Result<Question<String>, [String]>) -> UIViewController {
        return UIViewController()
    }
    
    
}
