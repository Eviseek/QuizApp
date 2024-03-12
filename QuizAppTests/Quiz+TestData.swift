//
//  Quiz+TestData.swift
//  QuizAppTests
//
//  Created by Eva Chlpikova on 11.03.2024.
//

import Foundation
@testable import QuizApp

extension QuizQuestion {
    
    static var TEST_DATA: [QuizQuestion] =
    [
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Which programming language, developed by Apple, is commonly used for creating iOS apps?",
            explanation: "Swift is a modern, safe, and powerful programming language developed by Apple for building applications across its ecosystem, including macOS, iOS, watchOS, and tvOS.",
            answers: [
                QuizAnswer(text: "Swift", isCorrect: true),
                QuizAnswer(text: "Java", isCorrect: false),
                QuizAnswer(text: "C#", isCorrect: false),
                QuizAnswer(text: "R", isCorrect: false),
                QuizAnswer(text: "Kotlin", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Which HTTP status code indicates that the requested resource has been permanently moved to a new location?",
            explanation: "The 301 status code informs the client that the requested resource has been permanently moved to a new URL. This redirection is used for scenarios like website restructuring or URL optimization.",
            answers: [
                QuizAnswer(text: "301 (Moved Permanently)", isCorrect: true),
                QuizAnswer(text: "404 (Not Found)", isCorrect: false),
                QuizAnswer(text: "200 (OK)", isCorrect: false),
                QuizAnswer(text: "503 (Service Unavailable)", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "In computer science, what does the acronym SQL stand for?",
            explanation: "SQL is a domain-specific language used for managing and querying relational databases. It provides commands for data manipulation, definition, and control within a database system.",
            answers: [
                QuizAnswer(text: "Secure Query Language", isCorrect: false),
                QuizAnswer(text: "Structured Query Language", isCorrect: true),
                QuizAnswer(text: "Simple Query Logic", isCorrect: false),
                QuizAnswer(text: "System Query Layer", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Which encryption algorithm is widely used for securing internet communications, including HTTPS websites?",
            explanation: "AES is a symmetric encryption algorithm widely adopted for its security and efficiency in protecting sensitive data during internet communication, including HTTPS connections.",
            answers: [
                QuizAnswer(text: "AES", isCorrect: true),
                QuizAnswer(text: "DES", isCorrect: false),
                QuizAnswer(text: "RSA", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "What is the name of Google's mobile operating system?",
            explanation: "Google's mobile operating system is called Android. It is based on the Linux kernel and designed primarily for touchscreen mobile devices such as smartphones and tablets.",
            answers: [
                QuizAnswer(text: "iOS", isCorrect: false),
                QuizAnswer(text: "Android", isCorrect: true),
                QuizAnswer(text: "Windows Mobile", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Who is the founder of Tesla Motors?",
            explanation: "Elon Musk is the founder of Tesla Motors, an American electric vehicle and clean energy company.",
            answers: [
                QuizAnswer(text: "Bill Gates", isCorrect: false),
                QuizAnswer(text: "Steve Jobs", isCorrect: false),
                QuizAnswer(text: "Elon Musk", isCorrect: true)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Which programming language is commonly used for web development and known for its simplicity and readability?",
            explanation: "Python is a popular programming language known for its simplicity and readability, making it a preferred choice for web development among developers.",
            answers: [
                QuizAnswer(text: "JavaScript", isCorrect: false),
                QuizAnswer(text: "Python", isCorrect: true),
                QuizAnswer(text: "Java", isCorrect: false),
                QuizAnswer(text: "Ruby", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "Which company developed the Java programming language?",
            explanation: "The Java programming language was developed by Sun Microsystems, which was later acquired by Oracle Corporation.",
            answers: [
                QuizAnswer(text: "Microsoft", isCorrect: false),
                QuizAnswer(text: "Apple", isCorrect: false),
                QuizAnswer(text: "Sun Microsystems", isCorrect: true),
                QuizAnswer(text: "IBM", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "What does HTML stand for?",
            explanation: "HTML stands for Hypertext Markup Language. It is the standard markup language for creating web pages and web applications.",
            answers: [
                QuizAnswer(text: "HyperText Markup Language", isCorrect: true),
                QuizAnswer(text: "Highly Typed Markup Language", isCorrect: false),
                QuizAnswer(text: "Hyperlink Text Manipulation Language", isCorrect: false),
                QuizAnswer(text: "Hyperspace Text Management Language", isCorrect: false)
            ]),
        QuizQuestion(
            id: UUID().uuidString,
            category: .technology,
            question: "What is the primary function of a firewall in computer networks?",
            explanation: "A firewall acts as a barrier between a trusted internal network and untrusted external networks. It monitors and controls incoming and outgoing network traffic based on predetermined security rules.",
            answers: [
                QuizAnswer(text: "To act as a barrier between trusted and untrusted networks", isCorrect: true),
                QuizAnswer(text: "To provide internet access", isCorrect: false)
            ])
    ]

}
