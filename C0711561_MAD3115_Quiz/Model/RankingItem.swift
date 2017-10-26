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
}
