//
//  QuizViewController_Tests.swift
//  QuizAppUITests
//
//  Created by Eva Chlpikova on 11.03.2024.
//

import XCTest

final class QuizViewController_Tests: XCTestCase {
    
    // Tests that the explanationView is displayed when 'Submit answers' button is clicked
    func test_QuizViewController_explanationView_isDisplayed () {
        let app = XCUIApplication()
        app.launch()
        
        let startQuizButton = app.buttons["startQuizButton"]
        startQuizButton.tap()
        
        let quizAnswerCell = app.tables.staticTexts["Java"]
        quizAnswerCell.tap()
        
        let submitAnswerButton = app.buttons["submitAnswersButton"]
        submitAnswerButton.tap()
        
        let explanationView = app.otherElements["explanationView"]
        XCTAssertTrue(explanationView.exists)
    }
    
    // Tests that the explanationView is gone when user goes to next question
    func test_QuizViewController_explanationView_isGone() {
        let app = XCUIApplication()
        app.launch()
    
        let startQuizButton = app.buttons["startQuizButton"]
        startQuizButton.tap()
        let quizAnswerCell = app.tables.staticTexts["Java"]
        quizAnswerCell.tap()
        let submitAnswerButton = app.buttons["submitAnswersButton"]
        submitAnswerButton.tap()
        
        let explanationView = app.otherElements["explanationView"]
        submitAnswerButton.tap()
        
        XCTAssertFalse(explanationView.exists)
    }
    
}
