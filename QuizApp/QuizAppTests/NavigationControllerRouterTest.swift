//
//  NavigationControllerRouterTest.swift
//  QuizAppTests
//
//  Created by Habibur Rahman on 10/9/24.
//

import XCTest
import QuizEngine
@testable import QuizApp

final class NavigationControllerRouterTest: XCTestCase {

    func test_routeToQuestion_presentQuestionVC(){
        
        let navigationController = UINavigationController()
        let factory = ViewControllerStub()
        let vc = UIViewController()
        factory.stub(question: "Q1", with: vc)
        
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        sut.routeTo(question: "Q1") { _ in
            
        }
        XCTAssertEqual(navigationController.viewControllers.count,1 )
        XCTAssertEqual(navigationController.viewControllers.first,vc )
    }
    
    func test_routeToQuestionTwice_presentQuestionVC(){
        
        let navigationController = UINavigationController()
        let factory = ViewControllerStub()
        let vc = UIViewController()
        let secondVC = UIViewController()
        
        factory.stub(question: "Q1", with: vc)
        factory.stub(question: "Q2", with: secondVC)
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        sut.routeTo(question: "Q1") { _ in}
        sut.routeTo(question: "Q2") { _ in}
        XCTAssertEqual(navigationController.viewControllers.count,2)
        XCTAssertEqual(navigationController.viewControllers.first, vc)
        XCTAssertEqual(navigationController.viewControllers.last, secondVC)
    }
    
    
    class ViewControllerStub : ViewControllerFactory {
        
        private var stubQuestions = [String:UIViewController]()
        
        func stub(question: String, with viewContyroller : UIViewController){
            stubQuestions[question] = viewContyroller
        }
        
        func questionVC(for question: String, answerCallback: (String) -> Void) -> UIViewController {
            return stubQuestions[question]!
        }
        
        
    }
    
}
