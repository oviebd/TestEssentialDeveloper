//
//  Router.swift
//  QuizEngine
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation
public protocol Router{
    
    associatedtype Answer
    associatedtype Question : Hashable
    
    func routeTo(question: Question, answerCallback: @escaping (Answer) -> Void)
    func routeTo(result : Result<Question,Answer>)
    
}
