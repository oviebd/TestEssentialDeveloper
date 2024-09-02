//
//  TableViewHelpers.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 2/9/24.
//

import Foundation
import UIKit

extension UITableView {
    func cell(at row : Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row : Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
    
    func selectRow(row: Int){
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
    
    func deSelectRow(row: Int){
        let indexPath = IndexPath(row: row, section: 0)
      deselectRow(at: indexPath, animated: false)
        delegate?.tableView?(self, didDeselectRowAt: indexPath)
    }
}
