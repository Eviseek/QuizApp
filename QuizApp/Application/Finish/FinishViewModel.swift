//
//  FinishViewModel.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import Foundation

class FinishViewModel {
    
    private var viewController: FinishViewController? = nil
    
    init() {}
    
    func viewDidLoad(viewController: FinishViewController) {
        self.viewController = viewController
    }
    
    func returnToStartClicked() {
        guard let viewController = viewController else { return }
        
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
