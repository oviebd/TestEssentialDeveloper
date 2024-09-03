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
        
        let sut = makeSut(answers: [makeDummyAnswer()])
        _ = sut.view
        XCTAssertEqual(makeSut().tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    
    func test_viewDidLoad_withCorrectAnswer_ConfigureCell(){
        
        let sut = makeSut(answers: [makeAnswer(question: "Q1", answer: "A1")])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text ,  "Q1")
        XCTAssertEqual(cell?.answerLabel.text ,  "A1")
    }
    
    func test_viewDidLoad_withWrongAnswer_ConfigureCell(){
        
        let sut = makeSut(answers: [makeAnswer(question: "Q1", answer: "A1", wrongAnswer: "wrong")])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLbl.text ,  "Q1")
        XCTAssertEqual(cell?.correctAnswerLbl.text ,  "A1")
        XCTAssertEqual(cell?.wrongAnswerLbl.text, "wrong")
    }
    
    
    //MARK : Helpers
    
    func makeSut(summary : String = "", answers : [PresentableAnswer] = []) -> ResultsViewController{
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    func makeDummyAnswer() -> PresentableAnswer {
        return makeAnswer()
    }

    func makeAnswer(question : String = "", answer : String = "", wrongAnswer : String? = nil ) -> PresentableAnswer {
        return PresentableAnswer(question: question,answer: answer, wrongAnswer: wrongAnswer )
    }
}
