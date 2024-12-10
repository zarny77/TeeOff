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
    var course: CourseModel
    var scores: [Int]
    var playedHoles: [Bool]
    var date: Date
    var holesPlayed: Int
    
    init(course: CourseModel) {
        self.id  = UUID()
        self.course = course
        self.date = Date()
        self.scores = course.holes.map { $0.par }
        self.playedHoles = Array(repeating: false, count: course.holes.count)
        self.holesPlayed = 0
    }
    
    // MARK: - Score Management
    
    func updateScore(for holeIndex: Int, score: Int) {
        guard holeIndex >= 0 && holeIndex < scores.count else { return }
        guard score >= 0 else { return}
        
        // check if hole has been played.
        // update the array to indicate it as played if not
        // and add to the holesPlayed tally
        if !playedHoles[holeIndex] {
            holesPlayed += 1
            playedHoles[holeIndex] = true
        }
        scores[holeIndex] = score
    }
    
}
// MARK: - Computed Properties
    
extension RoundModel {
    
    var totalScore: Int {
        zip(scores, playedHoles)
            .filter {_, played in played}
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    private var parForPlayedHoles: Int {
        zip(course.holes, playedHoles)
            .filter {_, played in played }
            .map { hole, _ in hole.par }
            .reduce(0,+)
    }
    
    var scoreRelativeToPar: Int {
        totalScore - parForPlayedHoles
    }
    
    var frontNine: Int {
        zip(scores.prefix(9), playedHoles.prefix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    var backNine: Int {
        zip(scores.suffix(9), playedHoles.suffix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
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
