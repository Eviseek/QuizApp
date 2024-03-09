//
//  MainViewViewModel.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import Foundation

class MainViewViewModel {
    
    init () {}
    
    func viewDidLoad() {
        NetworkManager.shared.fetchQuizData()
    }
    
    
    
}
