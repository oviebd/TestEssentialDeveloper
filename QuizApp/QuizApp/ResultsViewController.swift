//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Habibur Rahman on 2/9/24.
//

import Foundation
import UIKit

class ResultsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var summary = ""
    private var answers = [PresentableAnswer]()

    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
        
        tableView.register(CorrectAnswerCell.self)
        tableView.register(WrongAnswerCell.self)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.wrongAnswer == nil {
            return createCorrectAnswerCell(for: answer)
        }else{
           return createWrongAnswerCell(for: answer)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let answer = answers[indexPath.row]
//        if answer.wrongAnswer == nil {
//            return 70
//        }else{
//           return 90
//        }
//    }
    
    private func createCorrectAnswerCell (for answer : PresentableAnswer) -> UITableViewCell{
        let cell = tableView.dequeueReuseableCell(CorrectAnswerCell.self)!
        cell.questionLabel.text = answer.question
        cell.answerLabel.text = answer.answer
        return cell
    }
    
    private func createWrongAnswerCell (for answer : PresentableAnswer) -> UITableViewCell{
        let cell = tableView.dequeueReuseableCell(WrongAnswerCell.self)!
        
        cell.questionLbl.text = answer.question
        cell.correctAnswerLbl.text = answer.answer
        cell.wrongAnswerLbl.text = answer.wrongAnswer
        return cell
    }
    
    
}


 
