//
//  RoundModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-09.
//

import SwiftData
import Foundation

@Model
class RoundModel {
    var id: UUID
    var course: Course
    var scores: [Int]
    var date: Date
    var holesPlayed: Int
    
    init(course: Course) {
        self.id  = UUID()
        self.course = course
        self.date = Date()
        self.scores = Array(repeating: 0, count: course.holes.count)
        self.holesPlayed = 0
    }
    
}
// MARK: - Computed Properties
    
extension RoundModel {
    
    var totalScore: Int {
        scores.filter { $0 > 0 }.reduce(0, +)
    }
    
    private var parForPlayedHoles: Int {
        var par = 0
        for (index, score) in scores.enumerated() where score > 0 {
            par += course.holes[index].par
        }
        return par
    }
    
    var scoreRelativeToPar: Int {
        totalScore - parForPlayedHoles
    }
    
    var frontNine: Int {
        Array(scores.prefix(9))
            .filter { $0 > 0 }
            .reduce(0, +)
    }
    
    var backNine: Int {
        Array(scores.suffix(9))
            .filter { $0 > 0 }
            .reduce(0, +)
    }
    
    var isComplete: Bool {
        holesPlayed == course.holes.count
    }
    
    var isPartial: Bool {
        holesPlayed > 0 && !isComplete
    }

}

// MARK: - Formatting Helpers

extension RoundModel {
    
    // returns an over / under / even indicator for the score made
    var scoreRelativeToParFormatted: String {
        switch scoreRelativeToPar {
        case 0: return "E"
        case let score where score > 0: return "+\(score)"
        default: return "\(scoreRelativeToPar)"
        }
    }
}
