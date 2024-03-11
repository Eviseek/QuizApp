//
//  DefaultQuizAnswerCell.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import UIKit

class QuizAnswerCell: UITableViewCell {

    @IBOutlet weak var checkImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var answerTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderView.layer.cornerRadius = 5
        containerView.layer.cornerRadius = 3
        
    }
    
    func setCellUIForState(_ isSelected: Bool = false) {
        
        if !isSelected {
            setUnselectedUI()
        } else {
            setSelectedUI()
        }
        
    }
    
    func setCellResultUIForState(_ resultState: ResultState) {
        
        switch resultState {
        case .unselected:
            setUnselectedUI()
        case .selectedCorrect:
            setSelectedCorrectUI()
        case .selectedWrong:
            setSelectedWrongUI()
        }
        
    }
    
    private func setUnselectedUI() {
        
        checkImageView.image = UIImage(systemName: "square")
        checkImageView.tintColor = UIColor(named: "lightGray")
        borderView.backgroundColor = UIColor(named: "lightGray")
        containerView.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    private func setSelectedUI() {
        
        checkImageView.image = UIImage(systemName: "square.inset.filled")
        checkImageView.tintColor = UIColor(named: "darkGray")
        borderView.backgroundColor = UIColor(named: "lightGray")
        containerView.backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    private func setSelectedCorrectUI() {
        
        checkImageView.image = UIImage(systemName: "checkmark.square.fill")
        checkImageView.tintColor = UIColor(named: "correctAnswerDarkGreen")
        borderView.backgroundColor = UIColor(named: "correctAnswerDarkGreen")
        containerView.backgroundColor = UIColor(named: "correctAnswerLightGreen")
        
    }
    
    private func setSelectedWrongUI() {
        
        checkImageView.image = UIImage(systemName: "xmark.square.fill")
        checkImageView.tintColor = UIColor(named: "wrongAnswerDarkRed")
        borderView.backgroundColor = UIColor(named: "wrongAnswerDarkRed")
        containerView.backgroundColor = UIColor(named: "wrongAnswerLightRed")
        
    }
    
}
