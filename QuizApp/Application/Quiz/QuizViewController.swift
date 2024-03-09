//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var submitAnswerButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var currentQuestionOrderLabel: UILabel!
    @IBOutlet weak var totalQuestionsCountLabel: UILabel!
    
    @IBOutlet weak var resultsView: UIView!
    
    @IBOutlet weak var finalResultImageView: UIImageView!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    @IBOutlet weak var explanationLabel: UILabel!
    
    private let quizViewModel = QuizViewModel()
    
    private var showingResults = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizViewModel.viewDidLoad(viewController: self)
        
        tableViewSetUp()
        
    }
    
    //setting up the tableView
    private func tableViewSetUp() {
        
        let nib = UINib(nibName: "DefaultQuizAnswerCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "DefaultQuizAnswerCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
    }
    
    // this func prepares the view for a new question -> hides results, updated questionLabel, questionOrder and totalQuestionCount
    func loadNewQuestion(question: String, questionOrder: Int, totalQuestionsCount: Int) {
        
        submitAnswerButton.setTitle("Submit", for: .normal)
        
        hideQuizResults()
        
        questionLabel.text = question
        currentQuestionOrderLabel.text = questionOrder.description
        totalQuestionsCountLabel.text = totalQuestionsCount.description
    }
    
    func showQuizResults(finalQuizResult: QuizResult, explanation: String) {
        
        submitAnswerButton.setTitle("Next", for: .normal)
        
        showingResults = true
        
        explanationLabel.text = explanation
        
        switch finalQuizResult {
        case .correct:
            finalResultLabel.text = "Correct Answer"
            finalResultImageView.image = UIImage(systemName: "checkmark.square.fill")
        case .wrong:
            finalResultLabel.text = "Wrong Answer"
            finalResultImageView.image = UIImage(systemName: "xmark.square.fill")
        case .partial:
            finalResultLabel.text = "Partial Answer"
            finalResultImageView.image = UIImage(systemName: "xmark.square.fill")
        }
        
        resultsView.isHidden = false
        
        tableView.reloadData()
    }
    
    private func hideQuizResults() {
        showingResults = false
        resultsView.isHidden = true
        tableView.reloadData()
    }
    
    //enables or disables submit button depending in whether any answer is selected
    func changeSubmitButtonState(_ newState: Bool) {
        submitAnswerButton.isEnabled = newState
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

    @IBAction func submitAnswerOrShowNextQuestion(_ sender: UIButton) {
        if !showingResults {
            quizViewModel.submitButtonClicked()
        } else {
            quizViewModel.nextQuestionButtonClicked()
        }
    }
}

// MARK: TableView functinality

extension QuizViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizViewModel.displayedAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultQuizAnswerCell", for: indexPath) as? DefaultQuizAnswerCell {
            cell.selectionStyle = .none
            
            let displayedAnswer = quizViewModel.displayedAnswers[indexPath.row]
            
            cell.answerTextLabel.text = displayedAnswer.answer.text //setting the answer text
            
            if !showingResults { // if not showing results then update UI either as selected or unselected
                cell.setCellUIForState(displayedAnswer.isSelected)
            } else { // if showing results then update UI as unselected, correct, wrong
                cell.setCellResultUIForState(displayedAnswer.answerResult)
            }

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !showingResults {
            quizViewModel.cellSelectedAt(indexPath.row)
        }
    }
    
}
