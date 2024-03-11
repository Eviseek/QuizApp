//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation

class QuizViewModel {
    
    // since all quiz questions are displayed on the same screen, we are tracking all quiz data, currently displayed quiz and the order of the current quiz
    private let quizData: [Quiz] //or = Quiz.TEST_DATA
    private var displayedQuiz: Quiz
    private var currentQuestionOrder = 0
    
    // not private because viewController's tableView is using it
    var displayedAnswers = [DisplayedAnswer]()
    
    private weak var viewController: QuizViewController? = nil
    
    init?(quizData: [Quiz]?) {
        
        guard let quizData = quizData, !quizData.isEmpty else { return nil }
        
        self.quizData = quizData
        displayedQuiz = quizData[currentQuestionOrder]
        updateDisplayedAnswers(displayedQuiz)
    }
    
    func viewDidLoad(viewController: QuizViewController) {
        
        self.viewController = viewController
        
        // passes data to viewController -> current quiz question, its order and totalQuestionCount
        viewController.loadNewQuestion(question: displayedQuiz.question, questionOrder: currentQuestionOrder + 1, totalQuestionsCount: quizData.count)
        
    }
    
    private func updateDisplayedAnswers(_ displayedQuiz: Quiz) {
        
        displayedAnswers.removeAll() //clearing the array before each update
        
        for answer in displayedQuiz.answers {
            displayedAnswers.append(DisplayedAnswer(answer: answer)) //no need to set state, since it's unselected by default
        }
        
        displayedAnswers.shuffle() //randomizing the array
        
    }
    
    // this func is called when one of the quiz answers is tapped on, and it updates the cell state to either selected or unselected
    func cellTappedAt(_ index: Int) {
        
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
    
    // is called when submit button is clicked, and then the results are calculated
    func submitButtonClicked() {
        
        guard let viewController = viewController else { return }
        
        setFinalQuizResult()
        viewController.showQuizResultsWithExplanation(displayedQuiz.explanation)
        
    }
    
    func nextQuestionButtonClicked() {
        
        loadNewQuestion()
        
    }

    // loads next (new) question, and if there's no next, it pushes the finish screen
    private func loadNewQuestion() {
        
        guard let viewController = viewController else { return }
        
        currentQuestionOrder += 1
        
        if currentQuestionOrder < quizData.count {
            displayedQuiz = quizData[currentQuestionOrder]
            
            updateDisplayedAnswers(displayedQuiz)
            
            viewController.loadNewQuestion(question: displayedQuiz.question, questionOrder: currentQuestionOrder + 1, totalQuestionsCount: quizData.count)
        } else {
             continueToFinishScreen()
         }
        
    }
    
    // this func goes through every answer and sets its result
    // selectedCorrect = automatically assigned to every correct answer, because all correct answers must be shown to user, so there's no need to check if user has selected it
    // selectedWrong = if answer is wrong and user selected it
    // unselected = all other answers
    private func setFinalQuizResult() {
        
        for i in 0..<displayedAnswers.count {
        
            if displayedAnswers[i].answer.isCorrect {
                displayedAnswers[i].answerResult = .selectedCorrect //every correct answer must be shown to user
            } else if displayedAnswers[i].isSelected && !(displayedAnswers[i].answer.isCorrect) {
                displayedAnswers[i].answerResult = .selectedWrong // sets answer as selectedWrong, when user selected it and it was wrong
            } else {
                displayedAnswers[i].answerResult = .unselected // all other answers are unselected
            }
        }
        
    }
    
    private func continueToFinishScreen() {
        
        guard let viewController = viewController else { return }
        
        if let vc = viewController.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as? FinishViewController {
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
