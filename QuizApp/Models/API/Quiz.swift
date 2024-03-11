//
//  Quiz.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import Foundation

struct Quiz: Codable {
    var id: String
    var type: QuizType = .multipleChoice //enum; multiple or single choice quiz; by defalt multipleChoice
    var question: String //question such as "How many days are in a year?"
    var explanation: String //short explanation as to which answer is correct ans why
    var answers: [QuizAnswer]
}
