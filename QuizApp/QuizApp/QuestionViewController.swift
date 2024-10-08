//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Habibur Rahman on 18/8/24.
//

import Foundation
import UIKit

class QuestionViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private(set) var question  = ""
    private(set) var options = [String]()
    private var selection: (([String]) -> Void)? = nil
    private let reuseableIdentifier = "cell"
    
    convenience init(question: String, options : [String], selection :  @escaping (([String]) -> Void)) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        headerLabel.text = question
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(selectOptions(in: tableView))
        //selection?(tableView.indexPathsForSelectedRows!.map{options[$0.row]})
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.allowsMultipleSelection {
            selection?(selectOptions(in: tableView))
        }
        
    }
    
    private func selectOptions(in tableView : UITableView) -> [String]{
        guard let indexPath = tableView.indexPathsForSelectedRows else {return []}
        return indexPath.map {options[$0.row]}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return  cell
    }
    
    private func dequeCell(in tableView : UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier){
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseableIdentifier)
    }
}
