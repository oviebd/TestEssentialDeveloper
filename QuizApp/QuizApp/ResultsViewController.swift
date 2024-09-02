//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Habibur Rahman on 2/9/24.
//

import Foundation
import UIKit

struct PresentableAnswer {
    var isCorrect : Bool
}

class CorrectAnswerCell : UITableViewCell {
    
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
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isCorrect = answers[indexPath.row].isCorrect
        return isCorrect ? CorrectAnswerCell() : WrongAnswerCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
}
