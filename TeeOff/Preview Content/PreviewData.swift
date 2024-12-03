//
//  PreviewData.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-02.
//

import Foundation

enum PreviewData {
    // MARK: - Holes
    enum Holes {
        static let parThree = Hole(
            id: 1,
            par: 3,
            blues: 175,
            whites: 165,
            reds: 155
        )
        
        static let parFour = Hole(
            id: 2,
            par: 4,
            blues: 415,
            whites: 400,
            reds: 385
        )
        
        static let parFive = Hole(
            id: 3,
            par: 5,
            blues: 525,
            whites: 510,
            reds: 485
        )
        
        static let fullCourse: [Hole] = [
                    // Front 9
                    Hole(id: 1, par: 4, blues: 425, whites: 410, reds: 385),
                    Hole(id: 2, par: 3, blues: 175, whites: 165, reds: 155),
                    Hole(id: 3, par: 5, blues: 525, whites: 510, reds: 485),
                    Hole(id: 4, par: 4, blues: 410, whites: 395, reds: 375),
                    Hole(id: 5, par: 4, blues: 395, whites: 380, reds: 365),
                    Hole(id: 6, par: 3, blues: 185, whites: 175, reds: 165),
                    Hole(id: 7, par: 5, blues: 540, whites: 525, reds: 500),
                    Hole(id: 8, par: 4, blues: 405, whites: 390, reds: 375),
                    Hole(id: 9, par: 4, blues: 420, whites: 405, reds: 385),
                    // Back 9
                    Hole(id: 10, par: 4, blues: 415, whites: 400, reds: 380),
                    Hole(id: 11, par: 3, blues: 195, whites: 185, reds: 175),
                    Hole(id: 12, par: 5, blues: 535, whites: 520, reds: 495),
                    Hole(id: 13, par: 4, blues: 400, whites: 385, reds: 370),
                    Hole(id: 14, par: 4, blues: 430, whites: 415, reds: 395),
                    Hole(id: 15, par: 3, blues: 165, whites: 155, reds: 145),
                    Hole(id: 16, par: 5, blues: 530, whites: 515, reds: 490),
                    Hole(id: 17, par: 4, blues: 445, whites: 430, reds: 410),
                    Hole(id: 18, par: 4, blues: 405, whites: 390, reds: 375)
                ]
    }
    
    // MARK: - Courses
    enum Courses {
        static let sample = Course(
                    id: "Sample Golf Club",
                    address: "123 Golf Street, Winnipeg, MB",
                    blues: 7600,
                    whites: 7355,
                    reds: 7030,
                    par: 72,
                    holes: Holes.fullCourse
        )
    }
    
    // MARK: - Rounds
    
    static let empty = Round(course: Courses.sample)
    
    // Partial round
    static let partial: Round = {
        var round = Round(course: Courses.sample)
        for i in 0..<9 {
            round.updateScore(for: i, score: Courses.sample.holes[i].par)
        }
        return round
    }()
    
    static let completedPar: Round = {
        var round = Round(course: Courses.sample)
        for i in 0..<18 {
            round.updateScore(for: i, score: Courses.sample.holes[i].par)
        }
        return round
    }()
    
    static let goodRound: Round = {
        var round = Round(course: Courses.sample)
        for i in 0..<18 {
            let randomScore = Courses.sample.holes[i].par + [-1, 0].randomElement()!
            round.updateScore(for: i, score: randomScore)
        }
        return round
    }()
    
    static let badRound: Round = {
        var round = Round(course: Courses.sample)
        for i in 0..<18 {
            let randomScore = Courses.sample.holes[i].par + [1, 2].randomElement()!
            round.updateScore(for: i, score: randomScore)
        }
        return round
    }()
    
}
