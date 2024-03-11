//
//  ViewController.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loadingDataContainerView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startButtonBackgroundView: UIView!
    @IBOutlet weak var startButtonLabel: UILabel!
    
    private var mainViewVM = MainViewViewModel()
    private var failedToLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewVM.viewDidLoad(viewController: self)
        
        startButtonBackgroundView.layer.cornerRadius = 5
        
    }
    
    // this func sets UI when data successfully fetched
    func setReadyToStart() {

        startButton.isEnabled = true
        
        failedToLoad = false
        loadingDataContainerView.isHidden = true

        startButtonBackgroundView.backgroundColor = UIColor(named: "generalDarkBlue")
        startButtonLabel.text = "Start quiz"
    }
    
    // this func sets UI when failed to fetch data
    func setSomethingWentWrong() {
        
        startButton.isEnabled = true
        
        failedToLoad = true
        loadingDataContainerView.isHidden = true

        startButtonBackgroundView.backgroundColor = UIColor(named: "wrongAnswerDarkRed")
        startButtonLabel.text = "Click to load again"
        
    }
    
    // shows a dialog when failed to fetch data (for example: no internet connection)
    func showSomethingWentWrongDialog() {
        
        let alert = UIAlertController(title: "Error", message: "Failed to load data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { _ in
            self.mainViewVM.loadAgainButtonClicked()
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            self.setSomethingWentWrong()
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: IB Actions
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        if !failedToLoad {
            mainViewVM.startButtonClicked()
        } else {
            mainViewVM.loadAgainButtonClicked()
        }
        
    }
    
}

