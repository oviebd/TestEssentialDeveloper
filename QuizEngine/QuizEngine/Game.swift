//
//  Game.swift
//  QuizEngine
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation

public func startGame<Question: Hashable, Answer , R : Router>(questions : [Question], router : R, correctAnswers:[Question:Answer]) where R.Question == Question , R.Answer == Answer{
     
}
