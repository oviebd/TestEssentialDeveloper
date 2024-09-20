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
        
        factory.stub(question: Question.singleAnswer("Q1"), with: vc)
        factory.stub(question: Question.singleAnswer("Q2"), with: secondVC)
      
        
        sut.routeTo(question: Question.singleAnswer("Q1")) { _ in}
        sut.routeTo(question:  Question.singleAnswer("Q2")) { _ in}
        XCTAssertEqual(navigationController.viewControllers.count,2)
        XCTAssertEqual(navigationController.viewControllers.first, vc)
        XCTAssertEqual(navigationController.viewControllers.last, secondVC)
    }
    
    func test_routeToResult_ShowsResultVC(){
        let vc = UIViewController()
        let secondVC = UIViewController()
        
       
        let result = Result(initAnswers: [Question.singleAnswer("Q1"): ["A1"]], initScore: 10)
        let secondResult = Result(initAnswers: [Question.singleAnswer("Q2"): ["A2"]], initScore: 20)
        
        factory.stub(result: result, with: vc)
        factory.stub(result: secondResult, with: secondVC)
       
        sut.routeTo(result: result)
        sut.routeTo(result: secondResult)
     
        XCTAssertEqual(navigationController.viewControllers.count,2)
        XCTAssertEqual(navigationController.viewControllers.first, vc)
        XCTAssertEqual(navigationController.viewControllers.last, secondVC)
    }
    
    func test_routeToQuestion_presentQuestionVCWithRightCallback(){
    
        factory.stub(question: Question.singleAnswer("Q1"), with:  UIViewController())
      
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        var callbackWasFired = false
        sut.routeTo(question:  Question.singleAnswer("Q1") , answerCallback: { _  in
            callbackWasFired = true
        })
        factory.answerCallback [ Question.singleAnswer("Q1")]!(["anything"])
        
        XCTAssertTrue(callbackWasFired)
       
    }
    
    class FakeNavigationController : UINavigationController {
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false)
        }
    }
    
    class ViewControllerStub : ViewControllerFactory {
        
        private var stubQuestions = [Question<String>:UIViewController]()
        private var stubResult = [Result<Question<String>, [String]> :UIViewController]()
        var answerCallback = [Question<String>:([String]) -> Void]()
        
        func stub(question: Question<String>, with viewContyroller : UIViewController){
            stubQuestions[question] = viewContyroller
        }
        
        func stub(result: Result<Question<String>, [String]>, with viewContyroller : UIViewController){
            stubResult[result] = viewContyroller
        }
        
        func questionVC(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
            self.answerCallback[question] = answerCallback
            return stubQuestions[question] ?? UINavigationController()
        }
        
        func resultVC(for result: QuizEngine.Result<QuizApp.Question<String>, [String]>) -> UIViewController {
            return stubResult[result] ?? UIViewController()
        }
        
    }
    
}

extension Result : Hashable {

    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
        }

    
    public static func == (lhs : Result<Question,Answer>, rhs : Result<Question,Answer>) -> Bool {
        return lhs.score == rhs.score
    }
    
}
