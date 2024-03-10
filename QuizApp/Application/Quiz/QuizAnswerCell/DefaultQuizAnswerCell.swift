//
//  DefaultQuizAnswerCell.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 09.03.2024.
//

import UIKit

class DefaultQuizAnswerCell: UITableViewCell {

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var answerTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    }
    
    private func setSelectedUI() {
        checkImageView.image = UIImage(systemName: "square.inset.filled")
    }
    
    private func setSelectedCorrectUI() {
        checkImageView.image = UIImage(systemName: "checkmark.square.fill")
    }
    
    private func setSelectedWrongUI() {
        checkImageView.image = UIImage(systemName: "xmark.square.fill")
    }
    
}
