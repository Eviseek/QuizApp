//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation

class QuizViewModel {
    
    private let quizQuestions: [Quiz] = Quiz.TEST_DATA
    private var displayedQuiz: Quiz
    private var currentQuestionOrder = 0
    var displayedAnswers = [DisplayedAnswer]()
    
    private var finalQuizResult: QuizResult = .correct
    
    private var viewController: QuizViewController? = nil
    
    init() {
        displayedQuiz = quizQuestions[currentQuestionOrder]
        updateDisplayedAnswers(displayedQuiz)
    }
    
    private func updateDisplayedAnswers(_ currentQuiz: Quiz) {
        
        displayedAnswers.removeAll() //clearing the array before each update
        
        for answer in currentQuiz.answers {
            displayedAnswers.append(DisplayedAnswer(answer: answer)) //no need to set state, since it's unselected by default
        }
        
        displayedAnswers.shuffle() //randomizing the array
        
    }
    
    func viewDidLoad(viewController: QuizViewController) {
        self.viewController = viewController
        viewController.loadNewQuestion(question: displayedQuiz.question, questionOrder: currentQuestionOrder + 1, totalQuestionsCount: quizQuestions.count)
    }
    
    
    func cellSelectedAt(_ index: Int) {
        
        guard let viewController = viewController else { return }

        displayedAnswers[index].isSelected.toggle() //changes answer's state to selected and unselected
        
        var shouldBeEnabled = false
        
        for answer in displayedAnswers { //goes through all displayedAnswer, and if at least one of them is selected, sets shouldBeEnabled to true and enables 'Submit' button
            if answer.isSelected {
                shouldBeEnabled = true
                break
            }
        }
        
        viewController.changeSubmitButtonState(shouldBeEnabled)
        viewController.reloadTableView()
        
    }
    
    func submitButtonClicked() {
       
        guard let viewController = viewController else { return }
        
        setFinalQuizResult()
        viewController.showQuizResults(finalQuizResult: finalQuizResult, explanation: displayedQuiz.explanation)
    }
    
    func nextQuestionButtonClicked() {
        loadNewQuestion()
    }

    private func loadNewQuestion() {
        
        guard let viewController = viewController else { return }
         
        currentQuestionOrder += 1
        
         if currentQuestionOrder < quizQuestions.count {

             displayedQuiz = quizQuestions[currentQuestionOrder]
             
             updateDisplayedAnswers(displayedQuiz)
             
             viewController.loadNewQuestion(question: displayedQuiz.question, questionOrder: currentQuestionOrder + 1, totalQuestionsCount: quizQuestions.count)
         } else {
             
             print("all done")
             
         }
        
    }
    
    private func setFinalQuizResult() {
        
        finalQuizResult = .correct //setting final result as correct by default, so I can change it to partial or wrong
        
        for i in 0..<displayedAnswers.count {
            
            if !(displayedAnswers[i].isSelected) && displayedAnswers[i].answer.isCorrect { //if answer is correct, but not selected -> result partial
                finalQuizResult = .partial
            } else if displayedAnswers[i].isSelected && !(displayedAnswers[i].answer.isCorrect) { //if answer is wrong, but selected -> result wrong
                displayedAnswers[i].answerResult = .selectedWrong
                finalQuizResult = .wrong
                break
            } else {
                displayedAnswers[i].answerResult = .unselected
            }
            
            if displayedAnswers[i].answer.isCorrect { //every correct answer must be shown to user
                displayedAnswers[i].answerResult = .selectedCorrect
            }
        }
        
        
    }
    
    
}
