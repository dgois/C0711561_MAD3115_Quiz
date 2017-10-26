//
//  RankingManagement.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-26.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation

class RankingManagement {
    
    var myUserDefault = UserDefaults.standard
    
    func createOrUpdateRankingStatistics(summary: EndQuizSummary) {
        if let loggedUserName = myUserDefault.string(forKey: "loggedUserName") {
            
            var rankingFromUserDefault = myUserDefault.dictionary(forKey: "ranking") ?? [String: [String:String]]()
            
            var rankingItem = RankingItem(userName: loggedUserName)
            if let rankingItemEncoded = rankingFromUserDefault[loggedUserName] {
                rankingItem = RankingItem(rankingItemAsDictionary: rankingItemEncoded as! [String : Any])
            }
            
            rankingItem.attempts += 1
            if (rankingItem.higestScore < summary.correctAnswers) {
                rankingItem.higestScore = summary.correctAnswers
            }
            
            if let lowestScore = rankingItem.lowestScore {
                if lowestScore > summary.wrongAnswers {
                    rankingItem.lowestScore = summary.wrongAnswers
                }
            } else {
                rankingItem.lowestScore = summary.wrongAnswers
            }
            
            rankingFromUserDefault[loggedUserName] = rankingItem.convertToDictionary()
            myUserDefault.set(rankingFromUserDefault, forKey: "ranking")
        }
    }
    
    func getRanking() -> [String: RankingItem] {
        var ranking = [String: RankingItem]()
        if let rankingFromUserDefault = myUserDefault.dictionary(forKey: "ranking") {
            let keys = Array(rankingFromUserDefault.keys)
            for key in keys {
                let rankingItemAsAny = rankingFromUserDefault[key] as! [String : Any]
                let rankingItem = RankingItem(rankingItemAsDictionary: rankingItemAsAny)
                ranking[key] = rankingItem
            }
        }
        return ranking
    }
}
