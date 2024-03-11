//
//  PresentedAnswer.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation

// this struct is purely an in-app helper to track the state of currently displayed answers (default = unselected)

struct DisplayedAnswer {
    var answer: QuizAnswer
    var isSelected: Bool = false
    
    var answerResult: ResultState = .unselected
}
