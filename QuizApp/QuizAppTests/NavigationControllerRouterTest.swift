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

    let navigationController = FakeNavigationController()
    let factory = ViewControllerStub()
    lazy var sut : NavigationControllerRouter = {
        return NavigationControllerRouter(navigationController: self.navigationController, factory: self.factory)
    }()
    
    
    func test_routeToQuestion_ShowsQuestionVC(){
        
      
        let vc = UIViewController()
        let secondVC = UIViewController()
        
        factory.stub(question: "Q1", with: vc)
        factory.stub(question: "Q2", with: secondVC)
      
        
        sut.routeTo(question: "Q1") { _ in}
        sut.routeTo(question: "Q2") { _ in}
        XCTAssertEqual(navigationController.viewControllers.count,2)
        XCTAssertEqual(navigationController.viewControllers.first, vc)
        XCTAssertEqual(navigationController.viewControllers.last, secondVC)
    }
    
    func test_routeToQuestion_presentQuestionVCWithRightCallback(){
    
        factory.stub(question: "Q1", with:  UIViewController())
      
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        var callbackWasFired = false
        sut.routeTo(question: "Q1" , answerCallback: { _  in
            callbackWasFired = true
        })
        factory.answerCallback ["Q1"]!("anything")
        
        XCTAssertTrue(callbackWasFired)
       
    }
    
    class FakeNavigationController : UINavigationController {
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false)
        }
    }
    
    class ViewControllerStub : ViewControllerFactory {
        
        private var stubQuestions = [String:UIViewController]()
        var answerCallback = [String:(String) -> Void]()
        
        func stub(question: String, with viewContyroller : UIViewController){
            stubQuestions[question] = viewContyroller
        }
        
        func questionVC(for question: String, answerCallback: @escaping (String) -> Void) -> UIViewController {
            self.answerCallback[question] = answerCallback
            return stubQuestions[question] ?? UINavigationController()
        }
        
        
    }
    
}
