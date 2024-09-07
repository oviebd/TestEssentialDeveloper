//
//  GameTest.swift
//  QuizEngineTests
//
//  Created by Habibur Rahman on 7/9/24.
//


@testable import QuizEngine
import Foundation
import XCTest

final class GameTest: XCTestCase {

    
    func test_startGame_answerOneCorretlyOutOfTwo_score1(){
       
        let router = RouterSpy()
        startGame(questions: ["Q1", "Q2"], router: router , correctAnswers: ["Q1" : "A1", "Q2": "A2"])
        router.answerCallback("A1")
        router.answerCallback("wrong")
        
        XCTAssertEqual(router.routedResults?.score, 1)
    }
    

}
