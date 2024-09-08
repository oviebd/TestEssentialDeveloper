//
//  Game.swift
//  QuizEngine
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation


public class Game <Question: Hashable, Answer , R : Router> where R.Question == Question , R.Answer == Answer {
    let flow : Flow<Question, Answer, R>
    
    init(flow: Flow<Question, Answer, R>) {
        self.flow = flow
    }
}

public func startGame<Question: Hashable, Answer : Equatable, R : Router>(questions : [Question], router : R, correctAnswers:[Question:Answer]) -> Game<Question,Answer,R> where R.Question == Question , R.Answer == Answer{
    
    let flow = Flow(questions: questions, router: router, scoring: {scoring($0, correcrAnswers: correctAnswers)})
    flow.start()
    return Game(flow: flow)
}

private func scoring<Question : Hashable,Answer : Equatable>(_ answers : [Question:Answer], correcrAnswers : [Question:Answer]) -> Int {
    
    answers.reduce(0) { (score, tuple) in
        return score + (correcrAnswers[tuple.key] == tuple.value ? 1 : 0)
    }
    
   // return 1
}
