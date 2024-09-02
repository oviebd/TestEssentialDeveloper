//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Habibur Rahman on 2/9/24.
//

import Foundation
import UIKit

struct PresentableAnswer {
    var question : String
    let answer : String
    var isCorrect : Bool
}

class CorrectAnswerCell : UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
}

class WrongAnswerCell : UITableViewCell {
    
}

class ResultsViewController : UIViewController, UITableViewDataSource {
    
    
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
        
        tableView.register(UINib(nibName: "CorrectAnswerCell", bundle: nil), forCellReuseIdentifier: "CorrectAnswerCell")
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
            cell.questionLabel.text = answer.question
            cell.answerLabel.text = answer.answer
            return cell
        }
        return WrongAnswerCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
}
