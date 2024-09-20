//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 18/8/24.
//

import Foundation

import Foundation
import XCTest
@testable import QuizApp

class QuestionViewControllerTest : XCTestCase {
    
    func test_viewDidLoad_renderQuestionHeaderText(){
        XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
    }
    
    
    func test_viewDidLoad_rendersOneOption(){
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    
    func test_viewDidLoad_withOneOptions_rendersOneOptionText(){
        let sut = makeSUT(options: ["A1"])
        _ = sut.view
        XCTAssertEqual(sut.tableView.title(at: 0), "A1")
    }
    
    func test_optionSelected_withTwoOptions_NotifyDelegateWithLastSelection(){
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){receivedAnswer = $0}
        _ = sut.view
        sut.tableView.selectRow(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.selectRow(row: 1)
        XCTAssertEqual(receivedAnswer, ["A2"])
    }
    
    func test_optionDeSelected_withSingleOption_doesnotNotifyDelegateWithEmptySelection(){
        var callbackCount = 0
        let sut = makeSUT(options: ["A1"]){ _ in
            callbackCount += 1
        }
        _ = sut.view
        sut.tableView.selectRow(row: 0)
        XCTAssertEqual(callbackCount, 1)
        
        sut.tableView.deSelectRow(row: 0)
        XCTAssertEqual(callbackCount, 1)
    }
    
    
    func test_optionSelected_withMultipleOptionSelected_NotifyDelegateSelection(){
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){receivedAnswer = $0}
        sut.tableView.allowsMultipleSelection = true
        _ = sut.view
        sut.tableView.selectRow(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.selectRow(row: 1)
        XCTAssertEqual(receivedAnswer, ["A1", "A2"])

    }
    
    func test_optionDeSelected_withMultipleOptionSelected_NotifyDelegateSelection(){
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){receivedAnswer = $0}
        sut.tableView.allowsMultipleSelection = true
        _ = sut.view
        sut.tableView.selectRow(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.deSelectRow(row: 0)
        XCTAssertEqual(receivedAnswer, [])

    }
    
    // MARK : Helpers
    func makeSUT(question: String = "" , 
                 options: [String] = [],
                 selection: @escaping ([String]) -> Void = {_ in}) -> QuestionViewController{
        
//        let questionType = Question.singleAnswer(question)
//        let factory = iOSVCFactory(options: [questionType:options])
//        let sut = factory.questionVC(for: questionType, answerCallback: selection) as! QuestionViewController
        let sut = QuestionViewController(question: question, options: options, selection: selection)

        _ = sut.view
        return sut
    }
}

