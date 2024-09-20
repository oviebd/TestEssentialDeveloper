//
//  ViewControllerFactory.swift
//  QuizApp
//
//  Created by Habibur Rahman on 20/9/24.
//

import Foundation
import UIKit
import QuizEngine


protocol ViewControllerFactory {
    func questionVC(for question : Question<String>, answerCallback : @escaping ([String]) -> Void) -> UIViewController
    
    func resultVC(for result : Result< Question<String>, [String]>) -> UIViewController
}
