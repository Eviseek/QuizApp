//
//  FinishViewController.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import UIKit

class FinishViewController: UIViewController {
    
    private let finishViewModel = FinishViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishViewModel.viewDidLoad(viewController: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }

    @IBAction func returnToStartClicked(_ sender: UIButton) {
        finishViewModel.returnToStartClicked()
    }
}
