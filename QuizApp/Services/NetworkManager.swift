//
//  NetworkManager.swift
//  QuizApp
//
//  Created by Eva Chlpikova on 08.03.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let url = "https://quizapp-813e4-default-rtdb.europe-west1.firebasedatabase.app/quiz.json"
    
    private init() {}
    
    func fetchQuizData() {
        AF.request(url).responseDecodable(of: Quiz.self) { response in
            debugPrint(response)
        }
    }
    
    func saveQuizData(_ data: Quiz) {
        AF.request(url, method: .put, parameters: data, encoder: JSONParameterEncoder.default).response { response in
                debugPrint(response)
        }
    }
    
    
    
}
