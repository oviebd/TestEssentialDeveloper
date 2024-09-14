//
//  Question.swift
//  QuizApp
//
//  Created by Habibur Rahman on 14/9/24.
//

import Foundation
enum Question <T : Hashable> : Hashable {
    case singleAnswer(T)
    case multipleAnswer(T)
    
    var itemHashValue : Int {
        switch self {
            
        case .singleAnswer(let a ):
            return a.hashValue
        case .multipleAnswer(let a):
            return a.hashValue
        }
    }
    
    static func ==(lhs : Question<T>, rhs : Question<T>) -> Bool {
        switch(lhs,rhs){
            
        case (.singleAnswer(let a), .singleAnswer(let b)):
            return a == b
        case (.multipleAnswer(let a), .multipleAnswer(let b)):
            return a == b
            
        default :
            return false
        }
    }
}
