//
//  RoundStats.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-12.
//

import Foundation
import SwiftData

class StatManager {
    private let rounds: [RoundModel]
    
    init(rounds: [RoundModel]) {
        self.rounds = rounds
    }
    
    // MARK: - Basic Stats
    
    var totalRoundsPlayed: Int {
        rounds.count
    }
    
    var completedRounds: Int {
        rounds.filter { $0.isComplete }.count
    }
    
    var partialRounds: Int {
        rounds.filter { $0.isPartial }.count
    }
    
    var averageScore: Double? {
        let completedRounds = rounds.filter { $0.isComplete }
        guard !completedRounds.isEmpty else { return nil }
        
        let totalScore = completedRounds.reduce(0) { $0 + $1.totalScore }
        return Double(totalScore) / Double(completedRounds.count)
    }
    
    // MARK: - Best/Worst
    
    var bestRound: RoundModel? {
        rounds.filter { $0.isComplete }
            .min { $0.scoreRelativeToPar < $1.scoreRelativeToPar }
    }
    
    var worstRound: RoundModel? {
        rounds.filter { $0.isComplete }
            .max { $0.scoreRelativeToPar < $1.scoreRelativeToPar }
    }
    
    // MARK: - Time Stats
    
    var averageRoundDuration: TimeInterval? {
        let completedRounds = rounds.filter { $0.isComplete }
        guard !completedRounds.isEmpty else { return nil }
        
        let totalDuration = completedRounds.reduce(0) { $0 + ($1.roundDuration ?? 0) }
        return totalDuration / Double(completedRounds.count)
    }
    
    // MARK: - Course Specific Stats
    
    func averageScoreForCourse(_ courseID: String) -> Double? {
        let courseRounds = rounds.filter { $0.isComplete && $0.course.id == courseID }
        guard !courseRounds.isEmpty else { return nil }

        let totalScore = courseRounds.reduce(0) { $0 + $1.totalScore }
        return Double(totalScore) / Double(courseRounds.count)
    }
    
    func bestRoundForCourse(_ courseID: String) -> RoundModel? {
        rounds.filter { $0.isComplete && $0.course.id == courseID }
            .min { $0.scoreRelativeToPar < $1.scoreRelativeToPar }
    }
    
    func worstRoundForCourse(_ courseID: String) -> RoundModel? {
        rounds.filter { $0.isComplete && $0.course.id == courseID }
            .max { $0.scoreRelativeToPar < $1.scoreRelativeToPar }
    }
    
}
