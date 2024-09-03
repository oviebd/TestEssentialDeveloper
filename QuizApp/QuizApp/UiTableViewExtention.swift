//
//  UiTableViewExtention.swift
//  QuizApp
//
//  Created by Habibur Rahman on 3/9/24.
//

import Foundation
import UIKit

extension UITableView {
    func register(_ type : UITableViewCell.Type){
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func dequeueReuseableCell<T> (_ type : T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier:className) as? T
    }
}
