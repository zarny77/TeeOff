//
//  Round.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-05.
//

import Foundation
import SwiftUI

struct Round: Identifiable, Codable {
    // Rounds are unique
    let id: UUID
    // Course played
    let course: Course
    // Array for storing scores
    private(set) var scores: [Int] = []
    // when the round was played
    let date: Date
    private(set) var holesPlayed: Int
    
    
    init(course: Course) {
        self.id = UUID() // genereate ID
        self.course = course
        self.date = Date() // Current Date / time
        // Init with zeroes for each hole
        self.scores = Array(repeating: 0, count: course.holes.count)
        self.holesPlayed = 0
    }
 
    mutating func updateScore(for holeIndex: Int, score: Int)
    {
        guard holeIndex >= 0 && holeIndex < scores.count else { return }
        guard score > 0 else { return }
        
        // update hole counts
        if scores[holeIndex] == 0 && score > 0 {
            holesPlayed += 1
        }
        else if scores[holeIndex] > 0 && score == 0 {
            holesPlayed -= 1
        }
        
        scores[holeIndex] = score
    }
    
    // Totals the score for a round
    var totalScore: Int {
        scores.filter { $0 > 0 }.reduce(0, +)
    }
    
    var parForPlayedHoles: Int {
        var par = 0
        for( index, score ) in  scores.enumerated() where score > 0 {
            par += course.holes[index].par
        }
        return par
    }
    
    // gives your score minus the par of the course
    var scoreRelativeToPar: Int {
        totalScore - parForPlayedHoles
    }
    
    // gives the score on the front 9
    var frontScore: Int {
        Array(scores.prefix(9))
            .filter { $0 > 0 }
            .reduce(0, +)
    }
    
    // gives the score on teh back 9
    var backScore: Int {
        Array(scores.suffix(9))
            .filter { $0 > 0 }
            .reduce(0, +)
    }
    
    var isPartial: Bool {
        holesPlayed > 0 && holesPlayed < course.holes.count
    }
    
    var isComplete: Bool {
        holesPlayed == course.holes.count
    }
    
}
