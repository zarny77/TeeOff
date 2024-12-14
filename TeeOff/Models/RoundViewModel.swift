//
//  RoundViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-13.
//

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
    
    var scoreRelativeToPar: String {
        round.scoreRelativeToParFormatted
    }
    
    var date: String {
        round.dateFormatted()
    }
    
    var duration: String {
        round.durationFormatted()
    }
    
    var isComplete: Bool {
        round.isComplete
    }
    
    var holesPlayed: Int {
        round.holesPlayed
    }
    
    // MARK: - Score Management
    
    func updateScore(for holeIndex: Int, score: Int) {
        round.updateScore(for: holeIndex, score: score)
        save()
    }
    
    func finishRound() {
        round.finishRound()
        save()
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
    
    // MARK: - Score Stats
    
    func scoreRelativeToParForHole(_ index: Int) -> String {
        let score = scoreForHole(index)
        let par = parForHole(index)
        let diff = score - par
        
        switch diff {
        case 0: return "E"
        case let x where x > 0: return "+\(x)"
        default: return "\(diff)"
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
