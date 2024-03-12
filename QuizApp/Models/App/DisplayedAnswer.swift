//
//  PresentedAnswer.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation


/*
This struct is purely an in-app helper to track the state of currently displayed answers (default = unselected) and their final result.
    answer: contains a QuizAnswer -> text and isCorrect
    isSelected: tracks if user selected the answer in the tableView
    answerResult: after submitting the answers, is set to either:
        selectedCorrect (all correct answers)
        selectedWrong (selected & isCorrent = false)
        unselected (user hasn't selected it; isSelected = false)
 */

struct DisplayedAnswer {
    var answer: QuizAnswer
    var isSelected: Bool = false
    
    var answerResult: AnswerResult = .unselected
}
