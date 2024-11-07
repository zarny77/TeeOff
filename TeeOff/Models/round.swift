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
    
    let course: course
    let score: Int
    let date: Date
    let scorecard: ScorecardView
    
    init(course: course, score: Int, date: Date, scorecard: ScorecardView) {
        self.course = course
        self.score = score
        self.date = Date()
        self.scorecard = scorecard
    }
}
