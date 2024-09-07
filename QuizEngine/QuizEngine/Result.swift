//
//  Result.swift
//  QuizEngine
//
//  Created by Habibur Rahman on 7/9/24.
//

import Foundation

public struct Result<Question : Hashable, Answer> {
    let answers : [Question:Answer]
    let score : Int
}
