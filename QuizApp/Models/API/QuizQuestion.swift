//
//  QuizQuestion.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import Foundation

/*
 Quiz model has:
     id: String
     category: of type QuizCategory, which can be later used to divide quiz questions to different categories
     type: QuizType, which can later be used for single or multiple choice quiz; is .mutipleChoice by default
     question: String, main question such as 'How many days are in a year?'
     explanation: String, which is a short explanation as to which answer is correct
     answers: list of QuizAnswers, these contain the possible text answer, and if the answer is correct
 */

struct QuizQuestion: Codable {
    var id: String
    var category: QuizCategory
    var type: QuizType = .multipleChoice
    var question: String 
    var explanation: String
    var answers: [QuizAnswer]
}
