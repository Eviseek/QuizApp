//
//  ViewController.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    
    private var mainViewVM = MainViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainViewVM.viewDidLoad()
    }


}

