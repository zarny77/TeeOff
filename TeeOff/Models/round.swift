//
//  round.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-05.
//

/*
 * saves a scorecard view
 * keeps a total as the sum of scores 
 */
 

import Foundation


struct round {
    let score: Int
    let date: Date
    let scorecard: ScorecardView
    
    init(score: Int, date: Date, scorecard: ScorecardView) {
        self.score = score
        self.date = Date()
        self.scorecard = scorecard
    }
}
