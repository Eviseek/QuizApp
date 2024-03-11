//
//  MainViewViewModel.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import UIKit

class MainViewViewModel {
    
    private weak var viewController: MainViewController? = nil
    private var quizData: [Quiz]? = nil
    
    init () {}
    
    func viewDidLoad(viewController: MainViewController) {
        
        self.viewController = viewController
        fetchData()
        
    }
    
    // func that fetches the quiz data, and after that shows the 'start thw quiz' button
    private func fetchData() {
        
        guard let viewController = viewController else { return }
        
        NetworkManager.shared.fetchQuizData { quiz in
            if let quiz = quiz {
                self.quizData = quiz
                DispatchQueue.main.async {
                    viewController.setReadyToStart()
                }
            } else {
                DispatchQueue.main.async {
                    self.viewController?.showSomethingWentWrongDialog()
                }
            }
        }
        
    }
    
    func loadAgainButtonClicked() {
        
        guard let viewController = viewController else { return }
        fetchData()
        
    }
    
    func startButtonClicked() {
        
        guard let viewController = viewController else { return }
        
        if let vc = viewController.storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController {
            vc.quizData = self.quizData
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
