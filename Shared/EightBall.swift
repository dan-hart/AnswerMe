//
//  EightBall.swift
//  AnswerMe
//
//  Created by Dan Hart on 8/21/21.
//

import Foundation
import Combine

class EightBall: ObservableObject  {
    let baseURL = "https://api.duckduckgo.com/?q="
    let queryParameters = "&format=json&pretty=1&atb=v287-2"

    @Published var abstract: String?
    
    var shakeWithText: String? {
        didSet {
            shake(withQueryText: shakeWithText ?? "") { resultText in
                DispatchQueue.main.async {
                    self.abstract = resultText
                }
            }
        }
    }
    
    init() { }
    
    // MARK: - Functions
    func shake(withQueryText: String, then handler: @escaping (String?) -> Void) {
        abstract = nil
        
        guard let url = URL(string: "\(baseURL)\(withQueryText.replacingOccurrences(of: " ", with: "%20"))\(queryParameters)") else { return handler("Error with question") }
        let task = URLSession.shared.answerTask(with: url) { answer, response, error in
            if let answer = answer {
                return handler(answer.abstract)
            }
        }
        task.resume()
        
        let backupTask = URLSession.shared.unknownAnswerTask(with: url) { unknownAnswer, response, error in
            if let unknownAnswer = unknownAnswer {
                return handler(unknownAnswer.relatedTopics?.first?.text)
            } else {
                print("Could not find data")
            }
        }
        backupTask.resume()
    }
}
