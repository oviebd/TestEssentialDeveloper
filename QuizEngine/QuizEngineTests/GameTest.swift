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

    let router = RouterSpy()
    var game : Game<String,String,RouterSpy>!
    
    override func setUp() {
        super.setUp()
        game = startGame(questions: ["Q1", "Q2"], router: router , correctAnswers: ["Q1" : "A1", "Q2": "A2"])

    }
    
    func test_startGame_answerZeroCorretlyOutOfTwo_score1(){
        router.answerCallback("Wrong")
        router.answerCallback("wrong")
        
        XCTAssertEqual(router.routedResults?.score, 0)
    }
    
    func test_startGame_answerOneCorretlyOutOfTwo_score1(){
        router.answerCallback("A1")
        router.answerCallback("wrong")
        
        XCTAssertEqual(router.routedResults?.score, 1)
    }
    

}
