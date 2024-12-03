//
//  RoundViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-08.
//

import Foundation

enum RoundStatus {
    case inProgress
    case partial
    case complete
}

enum HoleStatus {
    case completed(Int)
    case notPlayed
}

class RoundViewModel: ObservableObject {
    @Published private(set) var round: Round
    @Published private(set) var roundStatus: RoundStatus = .inProgress
    
    init(course: Course) {
        self.round = Round(course: course)
    }
    
    // makes a copy of the round, updates it, and replaces the original
    func updateScore(for holeIndex: Int, score: Int) {
        var updatedRound = round
        updatedRound.updateScore(for: holeIndex, score: score)
        round = updatedRound
        updateRoundStatus()
    }
    
    private func updateRoundStatus() {
        if round.isComplete {
            roundStatus = RoundStatus.complete
        } else if round.isPartial {
            roundStatus = RoundStatus.partial
        } else {
            roundStatus = RoundStatus.inProgress
        }
    }
    // accessors
    
    func score(for holeIndex: Int) -> Int {
        round.scores[holeIndex]
    }
    
    var isRoundComplete: Bool {
        round.isComplete
    }
    
    // only saves complete rounds -- change this
    
    func saveRound() {
        if round.holesPlayed > 0{
            RoundStorage.shared.saveRound(round)
        }
    }
    
    func holeStatus(for index: Int) -> HoleStatus {
        let score = round.scores[index]
        return score > 0 ? .completed(score) : .notPlayed
    }
    
    
}
