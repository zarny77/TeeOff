//
//  PreviewData.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-02.
//

// TODO: Add mock CourseViewModels

import Foundation
import SwiftData
import SwiftUI

enum PreviewData {
    // MARK: - Holes
    enum Holes {
        static let parThree = HoleModel(
            id: 1,
            par: 3,
            blues: 175,
            whites: 165,
            reds: 155
        )
        
        static let parFour = HoleModel(
            id: 2,
            par: 4,
            blues: 415,
            whites: 400,
            reds: 385
        )
        
        static let parFive = HoleModel(
            id: 3,
            par: 5,
            blues: 525,
            whites: 510,
            reds: 485
        )
        
        static let fullCourse: [HoleModel] = [
            // Front 9
            HoleModel(id: 1, par: 4, blues: 425, whites: 410, reds: 385),
            HoleModel(id: 2, par: 3, blues: 175, whites: 165, reds: 155),
            HoleModel(id: 3, par: 5, blues: 525, whites: 510, reds: 485),
            HoleModel(id: 4, par: 4, blues: 410, whites: 395, reds: 375),
            HoleModel(id: 5, par: 4, blues: 395, whites: 380, reds: 365),
            HoleModel(id: 6, par: 3, blues: 185, whites: 175, reds: 165),
            HoleModel(id: 7, par: 5, blues: 540, whites: 525, reds: 500),
            HoleModel(id: 8, par: 4, blues: 405, whites: 390, reds: 375),
            HoleModel(id: 9, par: 4, blues: 420, whites: 405, reds: 385),
            // Back 9
            HoleModel(id: 10, par: 4, blues: 415, whites: 400, reds: 380),
            HoleModel(id: 11, par: 3, blues: 195, whites: 185, reds: 175),
            HoleModel(id: 12, par: 5, blues: 535, whites: 520, reds: 495),
            HoleModel(id: 13, par: 4, blues: 400, whites: 385, reds: 370),
            HoleModel(id: 14, par: 4, blues: 430, whites: 415, reds: 395),
            HoleModel(id: 15, par: 3, blues: 165, whites: 155, reds: 145),
            HoleModel(id: 16, par: 5, blues: 530, whites: 515, reds: 490),
            HoleModel(id: 17, par: 4, blues: 445, whites: 430, reds: 410),
            HoleModel(id: 18, par: 4, blues: 405, whites: 390, reds: 375)
        ]
    }
    
    // MARK: - Courses
    enum Courses {
        static let sample = CourseModel(
            name: "Sample Golf Club",
            address: "123 Golf Street, Winnipeg, MB",
            blues: 7600,
            whites: 7355,
            reds: 7030,
            par: 72,
            holes: Holes.fullCourse
        )
    }
    
    // MARK: - Rounds
    
    static var previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true) 
            let container = try ModelContainer(
                for: RoundModel.self,
                configurations: config
            )
            return container
        } catch {
            fatalError("Failed to create preview container: \(error.localizedDescription)")
        }
    }()
    
    // MARK: - Rounds
    @MainActor
    static let emptyViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
    @MainActor
    static let partialViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        for i in 0..<9 {
            round.updateScore(for: i, score: Courses.sample.holes[i].par)
        }
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
    @MainActor
    static let completedParViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        for i in 0..<18 {
            round.updateScore(for: i, score: Courses.sample.holes[i].par)
        }
        round.finishRound()
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
    @MainActor
    static let goodRoundViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        for i in 0..<18 {
            let randomScore = Courses.sample.holes[i].par + [-1, 0].randomElement()!
            round.updateScore(for: i, score: randomScore)
        }
        round.finishRound()
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
    @MainActor
    static let goodPartialViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        for i in 0..<9 {
            let randomScore = Courses.sample.holes[i].par + [-1, 0].randomElement()!
            round.updateScore(for: i, score: randomScore)
        }
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
    @MainActor
    static let badRoundViewModel: RoundViewModel = {
        let round = RoundModel(course: Courses.sample)
        for i in 0..<18 {
            let randomScore = Courses.sample.holes[i].par + [1, 2].randomElement()!
            round.updateScore(for: i, score: randomScore)
        }
        round.finishRound()
        return RoundViewModel(round: round, modelContext: previewContainer.mainContext)
    }()
    
}

