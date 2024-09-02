//
//  ResultsViewContrllerTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 2/9/24.
//

import XCTest
import Foundation
@testable import QuizApp

class ResultsViewContrllerTest: XCTestCase {

    func test_viewDidLoad_renderSummary(){
        XCTAssertEqual(makeSut(summary: "a summary").headerLabel.text, "a summary")
    }

    
    func test_viewDidLoad_rendersAnswers(){
        
        let sut = makeSut(answers: [makeAnswer()])
        _ = sut.view
        XCTAssertEqual(makeSut().tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswer_renderCorrectAnswerCell(){
        
        let sut = makeSut(answers: [PresentableAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCell(){
        
        let sut = makeSut(answers: [PresentableAnswer(isCorrect: false)])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
    }
    
    //MARK : Helpers
    
    func makeSut(summary : String = "", answers : [PresentableAnswer] = []) -> ResultsViewController{
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    func makeAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }

}
