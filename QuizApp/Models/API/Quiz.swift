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

extension Quiz {
    
    static var TEST_DATA: [Quiz] =
    [
        Quiz(
            id: UUID().uuidString,
            question: "Which programming language, developed by Apple, is commonly used for creating macOS, iOS, watchOS, and tvOS applications?",
            explanation: "Swift is a modern, safe, and powerful programming language developed by Apple for building applications across its ecosystem, including macOS, iOS, watchOS, and tvOS.",
            answers: [
                QuizAnswer(text: "Swift", isCorrect: true),
                QuizAnswer(text: "Java", isCorrect: false),
                QuizAnswer(text: "C#", isCorrect: false),
                QuizAnswer(text: "R", isCorrect: false),
                QuizAnswer(text: "Kotlin", isCorrect: false)
            ]),
        Quiz(
            id: UUID().uuidString,
            question: "Which HTTP status code indicates that the requested resource has been permanently moved to a new location?",
            explanation: "The 301 status code informs the client that the requested resource has been permanently moved to a new URL. This redirection is used for scenarios like website restructuring or URL optimization.",
            answers: [
                QuizAnswer(text: "301 (Moved Permanently)", isCorrect: true),
                QuizAnswer(text: "404 (Not Found)", isCorrect: false),
                QuizAnswer(text: "200 (OK)", isCorrect: false),
                QuizAnswer(text: "503 (Service Unavailable)", isCorrect: false)
            ]),
        Quiz(
            id: UUID().uuidString,
            question: "In computer science, what does the acronym SQL stand for?",
            explanation: "SQL is a domain-specific language used for managing and querying relational databases. It provides commands for data manipulation, definition, and control within a database system.",
            answers: [
                QuizAnswer(text: "Secure Query Language", isCorrect: false),
                QuizAnswer(text: "Structured Query Language", isCorrect: true),
                QuizAnswer(text: "Simple Query Logic", isCorrect: false),
                QuizAnswer(text: "System Query Layer", isCorrect: false)
            ]),
        Quiz(
            id: UUID().uuidString,
            question: "Which encryption algorithm is widely used for securing internet communications, including HTTPS websites?",
            explanation: "AES is a symmetric encryption algorithm widely adopted for its security and efficiency in protecting sensitive data during internet communication, including HTTPS connections.",
            answers: [
                QuizAnswer(text: "AES", isCorrect: true),
                QuizAnswer(text: "DES", isCorrect: false),
                QuizAnswer(text: "RSA", isCorrect: false)
            ])
    ]

}
