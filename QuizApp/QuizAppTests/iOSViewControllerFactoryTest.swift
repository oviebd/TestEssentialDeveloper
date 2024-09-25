//
//  iOSViewControllerTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 20/9/24.
//

import XCTest
@testable import QuizApp

final class iOSViewControllerFactoryTest: XCTestCase {

    
    let options = ["A1","A2"]
   
    func test_questionVC_SingleAnswer_createsControllerWithquestion(){
        XCTAssertEqual(makeQuestionVC(question: Question.singleAnswer("Q1")).question, "Q1")
    }
    
    func test_questionVC_SingleAnswer_createsControllerWithOptions(){
        XCTAssertEqual(makeQuestionVC(question: Question.singleAnswer("Q1")).options, options)
    }
    
    func test_questionVC_singleAnswer_createsControllerWithSingleSelection(){
       
        let controller = makeQuestionVC(question: Question.singleAnswer("Q1"))
        _ = controller.view
        
        XCTAssertFalse(controller.tableView.allowsMultipleSelection)
    }
    
    
    
    func test_questionVC_MultipleAnswer_createsControllerWithquestion(){
        XCTAssertEqual( makeQuestionVC(question: Question.multipleAnswer("Q1")).question, "Q1")
    }
    
    func test_questionVC_MultipleAnswer_createsControllerWithOptions(){
        XCTAssertEqual( makeQuestionVC(question: Question.multipleAnswer("Q1")).options, options)
    }
    
    func test_questionVC_MultipleAnswer_createsControllerWithSingleSelection(){
       
        let controller = makeQuestionVC(question: Question.multipleAnswer("Q1"))
        _ = controller.view
        
        XCTAssertTrue(controller.tableView.allowsMultipleSelection)
    }
    
    //MARK: HELPERS

    func makeSUT(options : Dictionary<Question<String>, [String]>) -> iOSVCFactory {
        return iOSVCFactory(options: options)
    }
    
    func makeQuestionVC(question : Question<String> = Question.singleAnswer("")) -> QuestionViewController {
        
        return makeSUT(options: [question:options]).questionVC(for: question, answerCallback: {_ in}) as! QuestionViewController
    }
}
