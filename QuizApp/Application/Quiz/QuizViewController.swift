//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var submitAnswerButton: UIButton!
    @IBOutlet weak var submitAnswerContainerView: UIView!
    @IBOutlet weak var submitAnswerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var currentQuestionOrderLabel: UILabel!
    @IBOutlet weak var totalQuestionsCountLabel: UILabel!
    
    @IBOutlet var explanationView: UIView!
    
    @IBOutlet weak var finalResultImageView: UIImageView!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    @IBOutlet weak var explanationLabel: UILabel!
    
    var quizData: [Quiz]? = nil
    
    private lazy var quizViewModel: QuizViewModel? = QuizViewModel(quizData: quizData)
    private var showingResults = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if quizViewModel == nil {
            showSomethingWentWrongDialog()
        }
        
        quizViewModel?.viewDidLoad(viewController: self)
        
        setUpOnViewDidLoad()
    }
    
    private func setUpOnViewDidLoad() {
        submitAnswerContainerView.layer.cornerRadius = 5
        explanationView.removeFromSuperview()
        
        setUpTableView()
        
        setUpNavigationBar()
    }
    
    // setting up the tableView
    private func setUpTableView() {
        let nib = UINib(nibName: "QuizAnswerCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "QuizAnswerCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
    }
    
    // setting up back button as hidden, and creating a close button
    private func setUpNavigationBar() {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let button = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(dismissView(sender:)))
        button.tintColor = UIColor(named: "generalDarkBlue")
        
        navigationItem.rightBarButtonItem = button
    }
    
    // this func is for the UIBarButton action
    @objc func dismissView(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showQuizResultsWithExplanation(_ explanation: String) {
        showingResults = true
        attachOrRemoveExplanationView(shouldAttach: showingResults)
        
        submitAnswerLabel.text = "Next"
        explanationLabel.text = explanation
        
        tableView.reloadData()
    }
    
    private func attachOrRemoveExplanationView(shouldAttach: Bool) {
        switch shouldAttach {
        case true:
            self.view.addSubview(explanationView)
            explanationView.layer.cornerRadius = 5
            
            // since the view was removed earlier, it doesn't have any constrains, so they are set up here again
            NSLayoutConstraint.activate([
                explanationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
                explanationView.bottomAnchor.constraint(equalTo: submitAnswerButton.topAnchor, constant: -20),
                explanationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
            ])
        case false:
            explanationView.removeFromSuperview()
        }
    }
    
    // this func prepares the view for a new question -> hides results, updates questionLabel, questionOrder and totalQuestionCount
    func loadNewQuestion(question: String, questionOrder: Int, totalQuestionsCount: Int) {
        hideQuizResults()
        
        submitAnswerLabel.text = "Submit"
        changeSubmitAnswerUI(when: false)
        
        questionLabel.text = question
        currentQuestionOrderLabel.text = questionOrder.description
        totalQuestionsCountLabel.text = totalQuestionsCount.description
    }
    
    private func hideQuizResults() {
        showingResults = false
        attachOrRemoveExplanationView(shouldAttach: showingResults)
        
        tableView.reloadData()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    // enables or disables submit button depending in whether any answer is selected
    func changeSubmitButtonState(_ newState: Bool) {
        submitAnswerButton.isEnabled = newState
        changeSubmitAnswerUI(when: newState)
    }
    
    func changeSubmitAnswerUI(when state: Bool) {
        switch state {
        case true:
            submitAnswerContainerView.backgroundColor = UIColor(named: "generalDarkBlue")
        case false:
            submitAnswerContainerView.backgroundColor = UIColor(named: "generalDarkBlueDisabled")
        }
    }
    
    func showSomethingWentWrongDialog() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: IBActions

    @IBAction func submitAnswerOrShowNextQuestion(_ sender: UIButton) {
        if !showingResults {
            quizViewModel?.submitButtonClicked()
        } else {
            quizViewModel?.nextQuestionButtonClicked()
        }
    }
}

// MARK: TableView functionality

extension QuizViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizViewModel?.displayedAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuizAnswerCell", for: indexPath) as? QuizAnswerCell {
            cell.selectionStyle = .none
            
            let displayedAnswer = quizViewModel?.displayedAnswers[indexPath.row]
            
            cell.answerTextLabel.text = displayedAnswer?.answer.text //setting the answer text
            
            // if not showing results then update UI either as selected or unselected
            if !showingResults {
                cell.setCellUIForState(displayedAnswer?.isSelected ?? false)
                
            // if showing results then update UI as unselected, correct, wrong
            } else {
                cell.setCellResultUIForState(displayedAnswer?.answerResult ?? .unselected)
            }

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !showingResults {
            quizViewModel?.cellTappedAt(indexPath.row)
        }
    }
    
}
