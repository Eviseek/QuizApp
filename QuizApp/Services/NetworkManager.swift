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
    
    // func for fetching the quiz data
    func fetchQuizData(completion: @escaping ([QuizQuestion]?) -> ()) {
        AF.request(url).responseDecodable(of: [QuizQuestion].self) { response in
            switch response.result {
            case .success (let quizData):
                completion(quizData)
            case .failure (let error):
                print("!!! Network Manager: something went wrong when fetching data \(error)")
                completion(nil)
            }
        }
    }
    
    // just an example func on how the data would be saved, it isn't actually used in the app
    func saveQuizData(_ data: [QuizQuestion], completion: @escaping () -> ()) {
        AF.request(url, method: .put, parameters: data, encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success:
                print("Data successfully saved to Firebase DB.")
            case .failure(let error):
                print("!!! Network Manager: Something went wrong when saving the data: \(error)")
            }
        }
    }
    
}
