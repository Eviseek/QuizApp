//
//  QuizViewController_Tests.swift
//  QuizAppUITests
//
//  Created by Eva Chlpikova on 11.03.2024.
//

import XCTest

final class QuizViewController_Tests: XCTestCase {
    
    var app: XCUIApplication = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        
        let startQuizButton = app.buttons["startQuizButton"]
        XCTAssertTrue(startQuizButton.exists)
        
        startQuizButton.tap()
        continueAfterFailure = false
    }
    
    // Tests that the explanationView is displayed when 'Submit answers' button is clicked
    func test_QuizViewController_explanationView_isDisplayed () {
        let quizAnswerCell = app.tables.cells.matching(identifier: "quizAnswerCell").firstMatch
        quizAnswerCell.tap()
        
        let submitAnswerButton = app.buttons["submitAnswersButton"]
        submitAnswerButton.tap()
        
        let explanationView = app.otherElements["explanationView"]
        XCTAssertTrue(explanationView.exists)
    }
    
    // Tests that the explanationView is gone when user goes to next question
    func test_QuizViewController_explanationView_isGone () {
        let quizAnswerCell = app.tables.cells.matching(identifier: "quizAnswerCell").firstMatch
        quizAnswerCell.tap()
        let submitAnswerButton = app.buttons["submitAnswersButton"]
        submitAnswerButton.tap()
        
        let explanationView = app.otherElements["explanationView"]
        submitAnswerButton.tap()
        
        XCTAssertFalse(explanationView.exists)
    }
    
    // Checks that the navigation's bar back button is hidden in quizViewController
    func test_QuizViewController_navigationBarBackButton_isHidden () {
        let backButton = app.navigationBars["QuizApp.QuizView"].buttons["backButton"]
        XCTAssertFalse(backButton.exists)
    }
    
    // Checks that the navigation cancel button is displayed and on click returns to main screen
    func test_QuizViewController_navigationBarCancelButton_isDisplayedAndRedirectsToMain () {
        let cancelButton = app.navigationBars["QuizApp.QuizView"]/*@START_MENU_TOKEN@*/.buttons["cancelButton"]/*[[".buttons[\"Close\"]",".buttons[\"cancelButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(cancelButton.exists)
        
        cancelButton.tap()
        
        let startQuizButton = app.buttons["startQuizButton"]
        XCTAssertFalse(cancelButton.exists)
        XCTAssertTrue(startQuizButton.exists)
    }
    
    // Checks that the 'Submit' button is enabled when answer selected
    func test_QuizViewController_submitAnswersButton_isEnabled () {
        let quizAnswerCell = app.tables.cells.matching(identifier: "quizAnswerCell").firstMatch
        quizAnswerCell.tap()
        
        let submitAnswersButton = app.buttons["submitAnswersButton"]
        XCTAssertTrue(submitAnswersButton.isEnabled)
    }
    
    // Checks that the 'Submit' button is disabled when answer is selected and then unselected
    func test_QuizViewController_submitAnswersButton_isDisabled () {
        let quizAnswerCell = app.tables.cells.matching(identifier: "quizAnswerCell").firstMatch
        
        // tap to select
        quizAnswerCell.tap()
        // tap to deselect
        quizAnswerCell.tap()
        
        let submitAnswersButton = app.buttons["submitAnswersButton"]
        XCTAssertFalse(submitAnswersButton.isEnabled)
    }
    
}
