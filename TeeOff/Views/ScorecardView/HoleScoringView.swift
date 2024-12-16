//
//  HoleScoringView.swift
//
//  Used in ScorecardView to handle user input for scoring
//
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct HoleScoringView: View {
    // MARK: - Properties
    var hole: HoleModel
    @Bindable var round: RoundViewModel
    
    private var score: Int {
        get { round.scoreForHole(hole.id - 1) }
        nonmutating set { round.updateScore(for: hole.id - 1, score: newValue) }
    }
    
    private var scoreRelativeToPar: Int { score - hole.par }
    
    private var scoreColour: Color {
        if score == 0 { return .primary }
        switch scoreRelativeToPar {
        case ..<0: return .green   // Under par
        case 0: return .blue    // Par
        case 1: return .orange     // Bogey
        default: return .red       // Double+
        }
    }

    // MARK: - Feedback
    private let parHaptic = UIImpactFeedbackGenerator(style: .light)
    private let scoreHaptic = UIImpactFeedbackGenerator(style: .medium)
    
    
    // MARK: - Initialization
    init(hole: HoleModel, round: RoundViewModel) {
        self.hole = hole
        self.round = round
    }
    
    private let logger = Logger(origin: "HoleScoringView")
    
    
    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .overlay(
                HStack {
                    Spacer()
                    holeInfoStack

                    VStack(alignment: .center, spacing: -5) {
                        scoreIndicator
                        HStack {
                            subtractButton
                            addButton
                        }
                    }
                    Spacer()
                }
                    .frame(maxHeight: .infinity)
            )
    }
    
    
    // MARK: - Components
    
    // Shows the yardages, par, and hole number
    private var holeInfoStack: some View {
        VStack(alignment: .center) {
            Spacer()
            // Hole number
            Text(String(hole.id))
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundStyle(round.isHolePlayed(hole.id - 1) ? .green : .secondary)
                .frame(height: 60)
                .minimumScaleFactor(0.1)
            
            Divider()
                .padding(.vertical, -3)
            
            // Par indicator
            Text("Par: " + String(hole.par))
                .font(.title3)
                .fontWeight(.bold)
            
            Divider()
                .padding(.vertical, -3)
            
            // Yardages
            VStack(alignment: .leading, spacing: 2) {
                YardageView(hole.blues, Color.blue)
                YardageView(hole.whites, Color.white)
                YardageView(hole.reds, Color.red)
            }
            
            Spacer()
        }
        .frame(width: 60)
        .padding(.vertical, 10)
    }
    
    /*
     Shows and manages the logic for the score indicator
     Score updates when tapped, used for marking a par
     without having to change the score
    */
    private var scoreIndicator: some View {
        Text(String(score))
            .font(.system(size: 100))
            .fontWeight(.black)
            .frame(width: 100, height: 100)
            .minimumScaleFactor(0.5)
            .foregroundStyle(round.isHolePlayed(hole.id - 1) ? .primary : .secondary)
            .onTapGesture {
                parHaptic.impactOccurred()
                round.updateScore(for: hole.id - 1, score: score)
                logger.log("Tapped score indicator, updating score", level: .info)
                if hole.par == score {
                    logger.log("Updated par", level: .success)
                } else {
                    logger.log("Updated score", level: .success)
                }
            }
    }
    
    
    // MARK: - Buttons
    private var subtractButton: some View {
        Button("Subtract Stroke", systemImage: "minus.circle.fill", action: {
            logger.log("Attempting to subtract", level: .info)
            if score > 1 {
                logger.log("Subtracted from score", level: .success)
                scoreHaptic.impactOccurred()
                self.score -= 1
            } else {
                logger.log("Score cannot be below 1. Did not subtract.", level: .success)
            }
        })
        .symbolRenderingMode(.hierarchical)
        .font(.largeTitle)
        .labelStyle(.iconOnly)
    }
    
    private var addButton: some View {
        Button("Add Stroke", systemImage: "plus.circle.fill", action: {
            logger.log("Adding to score", level: .info)
            scoreHaptic.impactOccurred()
            self.score += 1
        })
        .symbolRenderingMode(.hierarchical)
        .font(.largeTitle)
        .labelStyle(.iconOnly)
    }
}


// MARK: - Preview
#Preview {
    NavigationView {
        VStack(spacing: 20) {
            HoleScoringView(hole: PreviewData.Holes.parThree, round: PreviewData.goodRoundViewModel)
            HoleScoringView(hole: PreviewData.Holes.parFour, round: PreviewData.badRoundViewModel)
            HoleScoringView(hole: PreviewData.Holes.parFive, round:PreviewData.completedParViewModel)
        }
        .padding()
    }
}
