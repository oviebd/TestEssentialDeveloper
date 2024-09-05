//
//  FlowTests.swift
//  QuizEngineTests
//
//  Created by Habibur Rahman on 9/8/24.
//
@testable import QuizEngine
import Foundation
import XCTest


class FlowTests : XCTestCase {
   
    let router = RouterSpy()
    
    func test_start_withNoQuestions_doesNotRouteToAnyQuestion(){
        makeSut(questions: []).start()
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }

    
    func test_start_withOneQuestions_RoutesToCorrectQuestion(){
        makeSut(questions: ["01"]).start()
        XCTAssertEqual(router.routedQuestions, ["01"])
    }
    
    func test_start_withOneQuestions_RoutesToCorrectQuestion_2(){
        makeSut(questions: ["02"]).start()
        XCTAssertEqual(router.routedQuestions, ["02"])
    }
    
    func test_start_withTwoQuestions_RoutesToFirstQuestion(){
        makeSut(questions: ["01","02"]).start()
        XCTAssertEqual(router.routedQuestions, ["01"])
    }
    
    func test_startTwice_withTwoQuestions_RoutesToFirstQuestionTwice(){
        let sut = makeSut(questions: ["01", "02"])
        sut.start()
        sut.start()
        XCTAssertEqual(router.routedQuestions, ["01", "01"])
    }
    
    
    func test_startAndAnswerFirstAndSecondQuestion_withThreeQuestions_RoutesToSecondAndThirdQuestion(){
        
        let sut = makeSut(questions: ["01", "02", "03"])
        sut.start()
        router.answerCallback("A1")
        router.answerCallback("A2")
        
        XCTAssertEqual(router.routedQuestions, ["01", "02", "03"])
    }
    
    
    func test_startAndAnswerFirstQuestion_withOneQuestions_doesNotRoutesToAnotherQuestion(){
        
        let sut = makeSut(questions: ["01"])
        sut.start()
        router.answerCallback("AI")
        
        XCTAssertEqual(router.routedQuestions, ["01"])
    }
    
    func test_start_withNoQuestions_routesToResult(){
        makeSut(questions: []).start()
        XCTAssertEqual(router.routedResults, [:])
    }

    func test_start_withOneQuestions_doesnotRoutesToResult(){
        makeSut(questions: ["01"]).start()
        XCTAssertNil(router.routedResults)
    }
    
    func test_startAndAnswerFirstQuestion_withOneQuestions_routesToResult(){
        let sut = makeSut(questions: ["01"])
        sut.start()
        router.answerCallback("A1")
        
        XCTAssertEqual(router.routedResults, ["01":"A1"])
    }

    func test_startAndAnswerFirstQuestion_withTwoQuestions_doesnotRoutesToResult(){
        let sut = makeSut(questions: ["01","02"])
        sut.start()
        router.answerCallback("A1")
        
        XCTAssertNil(router.routedResults)
    }
    
    func test_startAndAnswerFirstAndSecondQuestion_withTwoQuestions_routesToResult(){
        let sut = makeSut(questions: ["01","02"])
        sut.start()
        router.answerCallback("A1")
        router.answerCallback("A2")
        
        XCTAssertEqual(router.routedResults, ["01":"A1", "02":"A2"])
    }
    
    // MARK: Helpers
    func makeSut (questions : [String]) -> Flow<String,String, RouterSpy> {
        return Flow(questions: questions, router: router)
    }
    
    class RouterSpy : Router {
      
        

        var routedQuestions : [String] = []
        var routedResults : [String:String]? = nil
        var answerCallback: (String) -> Void = { _ in}
        
        func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
            self.routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
        
        
        func routeTo(result: [String : String]) {
            routedResults = result
        }
    }
}
