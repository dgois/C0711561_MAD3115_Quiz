//
//  RankingItem.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-25.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation

class RankingItem {
    
    var userName: String
    var higestScore: Int
    var lowestScore: Int?
    var attempts: Int
    
    init(userName: String) {
        self.userName = userName
        higestScore = 0
        attempts = 0
    }
    
    init(rankingItemAsDictionary: [String: Any]) {
        self.userName = rankingItemAsDictionary["userName"] as! String
        
        let higestScoreAsString = rankingItemAsDictionary["higestScore"] as! String
        self.higestScore = Int(higestScoreAsString)!
        
        let lowestScoreAsString = rankingItemAsDictionary["lowestScore"] as! String
        self.lowestScore = Int(lowestScoreAsString)!
        
        let attemptsAsString = rankingItemAsDictionary["attempts"] as! String
        self.attempts = Int(attemptsAsString)!
    }
    
    func convertToDictionary() -> [String: String] {
        var response = [String: String]()
        response["userName"] = userName
        response["higestScore"] = String(higestScore)
        response["attempts"] = String(attempts)
        
        if let ls = lowestScore {
            response["lowestScore"] = String(ls)
        } else {
            response["lowestScore"] = nil
        }

        return response
    }
}
