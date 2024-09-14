//
//  QuestionTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 14/9/24.
//

import XCTest
import Foundation
@testable import QuizApp

final class QuestionTest: XCTestCase {

    func test_hashValue_SingleAnswer_ReturnsTypeHash() {
        
        let type = "A string"
        let sut = Question.singleAnswer(type)
        XCTAssertEqual(sut.itemHashValue, type.hashValue)
    }
    
    func test_hashValue_MultipleAnswer_ReturnsTypeHash() {
        
        let type = "A string"
        let sut = Question.multipleAnswer(type)
        XCTAssertEqual(sut.itemHashValue, type.hashValue)
    }
    
    func test_equal_isEqual() {
        
        XCTAssertEqual(Question.singleAnswer("A string"), Question.singleAnswer("A string"))
        XCTAssertEqual(Question.multipleAnswer("A string"), Question.multipleAnswer("A string"))
    }
    
    func test_notEqual_isNotEqual() {
    
        XCTAssertNotEqual(Question.singleAnswer("A string"), Question.singleAnswer("Another String"))
        XCTAssertNotEqual(Question.multipleAnswer("A string"), Question.multipleAnswer("Another String"))
        
        XCTAssertNotEqual(Question.singleAnswer("A string"), Question.multipleAnswer("Another String"))
        XCTAssertNotEqual(Question.singleAnswer("A string"), Question.multipleAnswer("A string"))
    }
    

}
