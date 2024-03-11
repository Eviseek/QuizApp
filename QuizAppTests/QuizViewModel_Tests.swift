//
//  QuizViewModel_Tests.swift
//  QuizAppTests
//
//  Created by Eva Chlpikova on 11.03.2024.
//

// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehaviour
// Testing Structure: Given, When, Then

import XCTest
@testable import QuizApp

final class QuizViewModel_Tests: XCTestCase {
    
    var quizViewController: QuizViewController?
    var quizData = Quiz.TEST_DATA
    
    override func setUp() {
        quizViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController
        // force viewDidLoad and load outlets
        _ = quizViewController?.view
        
        quizData.shuffle()
    }
    
    // Checks that viewModel doesn't init when quiz is nil or empty
    func test_QuizViewModel_viewModelInit_shouldNotInitialize() {
        // Given
        let quizDataNil: [Quiz]? = nil
        
        // When
        var quizViewModel = QuizViewModel(quizData: quizDataNil)
        
        // Then
        XCTAssertNil(quizViewModel)
        
        // When
        let quizDataEmpty: [Quiz]? = [Quiz]()
        quizViewModel = QuizViewModel(quizData: quizDataEmpty)
        
        // Then
        XCTAssertNil(quizViewModel)
    }
    
    // Checks that the answer that was clicked on, is selected
    func test_QuizViewModel_cellTappedAt_shouldBeSelected() {
        // Given
        let quizViewModel = QuizViewModel(quizData: quizData)
        quizViewModel?.viewDidLoad(viewController: quizViewController)
        
        // When
        let randomPosition = Int.random(in: 0..<quizData.count)
        quizViewModel?.cellTappedAt(randomPosition)
        
        // Then
        XCTAssertTrue(quizViewModel?.displayedAnswers[randomPosition].isSelected ?? false)
    }
    
    // Checks that answer that was clicked on twice - selected, and then unselected - really ends up unselected
    func test_QuizViewModel_cellTappedAt_shouldNOTBeSelected() {
        // Given
        let quizViewModel = QuizViewModel(quizData: quizData)
        quizViewModel?.viewDidLoad(viewController: quizViewController)
        
        // When
        let randomPosition = Int.random(in: 0..<quizData.count)
        quizViewModel?.cellTappedAt(randomPosition) //tap to select
        quizViewModel?.cellTappedAt(randomPosition) //tap to unselect
        
        // Then
        XCTAssertFalse(quizViewModel?.displayedAnswers[randomPosition].isSelected ?? true)
    }
    
    // Finds an answer that is correct and checks if after submission its result is 'selectedCorrect'
    func test_QuizViewModel_submitButtonClicked_resultsShouldBeCorrect() {
        let quizViewModel = QuizViewModel(quizData: quizData)
        quizViewModel?.viewDidLoad(viewController: quizViewController)
        let displayedAnswers = quizViewModel?.displayedAnswers
        
        if let correctAnswerAtPosition = displayedAnswers?.firstIndex(where: { $0.answer.isCorrect == true }) {
            quizViewModel?.submitButtonClicked()
            XCTAssertTrue(quizViewModel?.displayedAnswers[correctAnswerAtPosition].answerResult == .selectedCorrect)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    // Finds an answer that is wrong, selects it and checks if after submission its result is 'selectedWrong'
    func test_QuizViewModel_submitButtonClicked_resultShouldBeWrong() {
        let quizViewModel = QuizViewModel(quizData: quizData)
        quizViewModel?.viewDidLoad(viewController: quizViewController)
        let displayedAnswers = quizViewModel?.displayedAnswers
        
        if let wrongAnswerAtPosition = displayedAnswers?.firstIndex(where: { $0.answer.isCorrect == false }) {
            // Tap the wrong answer
            quizViewModel?.cellTappedAt(wrongAnswerAtPosition)
            
            quizViewModel?.submitButtonClicked()
            XCTAssertTrue(quizViewModel?.displayedAnswers[wrongAnswerAtPosition].answerResult == .selectedWrong)
        } else {
            XCTAssertTrue(false)
        }
    }
    
    // Finds an answer that wasn't selected, and checks if after submission its result is 'unselected'
    func test_QuizViewModel_submitButtonClicked_resultShouldBeUnselected() {
        let quizViewModel = QuizViewModel(quizData: quizData)
        quizViewModel?.viewDidLoad(viewController: quizViewController)
        let displayedAnswers = quizViewModel?.displayedAnswers
        
        // Since all correct answers have automatically 'selectedCorrect' result, we need a wrong answer
        if let wrongAnswerAtPosition = displayedAnswers?.firstIndex(where: { $0.answer.isCorrect == false }) {
            quizViewModel?.submitButtonClicked()
            XCTAssertTrue(quizViewModel?.displayedAnswers[wrongAnswerAtPosition].answerResult == .unselected)
        } else {
            XCTAssertTrue(false)
        }
    }

}
