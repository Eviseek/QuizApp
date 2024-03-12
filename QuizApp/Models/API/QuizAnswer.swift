//
//  QuizAnswer.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation

/*
 Quiz answer has:
     text: text of the answer
     isCorrect: either true of false
 */

struct QuizAnswer: Codable {
    var text: String
    var isCorrect: Bool
}
