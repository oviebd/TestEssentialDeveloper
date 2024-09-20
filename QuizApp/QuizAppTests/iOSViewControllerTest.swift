//
//  iOSViewControllerTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 20/9/24.
//

import XCTest
@testable import QuizApp

final class iOSViewControllerTest: XCTestCase {

    func test_questionVC_createsControllerWithquestion(){
        let questions = Question.singleAnswer("Q1")
        let options = ["A1","A2"]
        let sut = iOSVCFactory(options: [questions:options])
        let controller = sut.questionVC(for: Question.singleAnswer("Q1"), answerCallback: {_ in}) as? QuestionViewController
        
        XCTAssertEqual(controller?.question, "Q1")
    }
    
    func test_questionVC_createsControllerWithOptions(){
        let questions = Question.singleAnswer("Q1")
        let options = ["A1","A2"]
        let sut = iOSVCFactory(options: [questions:options])
        let controller = sut.questionVC(for: Question.singleAnswer("Q1"), answerCallback: {_ in}) as? QuestionViewController
        
        XCTAssertEqual(controller?.options, options)
    }

}
