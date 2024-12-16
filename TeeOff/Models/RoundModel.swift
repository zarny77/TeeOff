//
//  RoundModel.swift
//  HoleOut
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
    var startTime: Date?
    var endTime: Date?
    
    init(course: CourseModel) {
        self.id  = UUID()
        self.course = course
        self.date = Date()
        self.scores = course.holes.map { $0.par }
        self.playedHoles = Array(repeating: false, count: course.holes.count)
        self.holesPlayed = 0
        self.startTime = Date()
    }
    
    // MARK: - Score / Round Management
    
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
    
    func finishRound() {
        self.endTime = Date()
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
    
    var roundDuration: TimeInterval? {
        guard let start = startTime else { return nil }
        let end = endTime ?? Date()
        return end.timeIntervalSince(start)
    }
    
}
