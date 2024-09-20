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
    
    func questionVC(for question: Question<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
        
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options[question]!) { _ in}
            
        default :
            return UIViewController()
        }
        
       
    }
    
    func resultVC(for result: QuizEngine.Result<Question<String>, String>) -> UIViewController {
        return UIViewController()
    }
    
    
}
