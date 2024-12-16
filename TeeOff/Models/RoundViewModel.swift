//
//  RoundViewModel.swift
//  HoleOut
//
//  interface for the RoundModel
//  handles persistence management and
//  updating for the modelcontext

//  Created by Dylan Zarn on 2024-12-13.
//

// TODO: Round Storage / Save Management

import Foundation
import SwiftUI
import SwiftData

@Observable
class RoundViewModel {
    private var round: RoundModel
    private var modelContext: ModelContext
    
    private let logger = Logger(origin: "RoundViewModel")
    
    init(round: RoundModel, modelContext: ModelContext) {
        self.round = round
        self.modelContext = modelContext
    }
    
    // MARK: - Public Properties
    
    var totalScore: Int {
        round.totalScore
    }
    
    var scoreRelativeToPar: Int {
        round.scoreRelativeToPar
    }
    
    var date: String {
        round.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    var duration: String {
        guard let duration = round.roundDuration else { return "Not Started" }
        
        let hours = Int(duration) / 3600
        let minutes = Int(duration) / 60 % 60
        
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
    
    var isComplete: Bool {
        round.isComplete
    }
    
    var holesPlayed: Int {
        round.holesPlayed
    }
    
    var frontNine: Int {
        round.frontNine
    }
    
    var backNine: Int {
        round.backNine
    }
    
    var course: CourseModel {
        round.course
    }
    
    // MARK: - Score Management
    
    func updateScore(for holeIndex: Int, score: Int) {
        round.updateScore(for: holeIndex, score: score)
        save()
    }
    
    // MARK: - Model Management
    
    func finishRound() {
        round.finishRound()
        save()
    }
    
    func deleteRound() {
        modelContext.delete(round)
        logger.log("Deleted round: \(round.id)", level: .success)
    }
    
    // MARK: - Hole Status
    
    func isHolePlayed(_ index: Int) -> Bool {
        round.playedHoles[index]
    }
    
    func scoreForHole(_ index: Int) -> Int {
        round.scores[index]
    }
    
    func parForHole(_ index: Int) -> Int {
        round.course.holes[index].par
    }
    
    // MARK: - Formatting Helpers
    
    // returns the score of the round
    // relative to the course par as a string
    var scoreRelativeToParFormatted: String {
        switch round.scoreRelativeToPar {
        case 0: return "E"
        case let score where score > 0: return "+\(score)"
        default: return "\(round.scoreRelativeToPar)"
        }
    }
    
    // MARK: - Private Helpers
    
    private func save() {
        do {
            try modelContext.save()
        } catch {
            logger.log("Error saving round: \(error.localizedDescription)")
        }
    }
}
