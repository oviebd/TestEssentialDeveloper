//
//  Result.swift
//  QuizEngine
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation

public struct Result<Question : Hashable, Answer> {
    public var answers : [Question:Answer] //{ get set }
    public var score : Int //{ get set }
}


public extension Result {
    init(initAnswers : [ Question: Answer],initScore : Int){
        answers = initAnswers
        score = initScore
    }
}
