//
//  RouterSpy.swift
//  QuizEngineTests
//
//  Created by Habibur Rahman on 7/9/24.
//

@testable import QuizEngine
import Foundation
import XCTest

class RouterSpy : Router {
  
    var routedQuestions : [String] = []
    var routedResults : Result<String,String>? = nil
    var answerCallback: (String) -> Void = { _ in}
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        self.routedQuestions.append(question)
        self.answerCallback = answerCallback
    }
    
    
    func routeTo(result:Result<String,String>) {
        routedResults = result
    }
}
