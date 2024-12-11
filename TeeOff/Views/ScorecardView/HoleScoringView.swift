//
//  HoleScoringView.swift
//
//  Used in ScorecardView to handle user input for scoring
//
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct HoleScoringView: View {
    
    
    
    var hole: HoleModel
    @Bindable var round: RoundModel
    
    

    private let parHaptic = UIImpactFeedbackGenerator(style: .light)
    private let scoreHaptic = UIImpactFeedbackGenerator(style: .medium)
    
    init(hole: HoleModel, round: RoundModel) {
        self.hole = hole
        self.round = round
    }
    
    private let logger = Logger(origin: "HoleScoringView")
    
    private var score: Int {
        get { round.scores[hole.id - 1] } // hole id is 1 based,
        nonmutating set { round.updateScore(for: hole.id - 1, score: newValue) }
    }
    
    private var isHolePlayed: Bool {
        round.playedHoles[hole.id - 1]
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .overlay(
                HStack {
                    
                    Spacer()
                    
                    // left stack: hole #, par, yardages
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(isHolePlayed ? .green : .secondary)
                            .frame(height: 60)
                            .minimumScaleFactor(0.1)
                        
                        Divider()
                            .padding(.vertical, -3)
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Divider()
                            .padding(.vertical, -3)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            YardageView(hole.blues, Color.blue)
                            YardageView(hole.whites, Color.white)
                            YardageView(hole.reds, Color.red)
                        }
                        
                        Spacer()
                    }
                    .frame(width: 60)
                    .padding(.vertical, 10)
                

                    // right stack: score and buttons
                    VStack(spacing: -5) {
                        Text(String(score))
                            .font(.system(size: 100))
                            .fontWeight(.black)
                            .frame(width: 100, height: 100)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(isHolePlayed ? .primary : .secondary)
                            .contentShape(Rectangle())
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
                        
                        // buttons
                        HStack {
                            // subtract left
                            Button("Subtract Stroke", systemImage: "minus.circle.fill", action:
                                    {
                                logger.log("Attempting to subtract", level: .info)
                                if score > 1 {
                                    logger.log("Subtracted from score", level: .success)
                                    scoreHaptic.impactOccurred()
                                    self.score -= 1
                                } else {
                                    logger.log("Failed to subtract: Score cannot be below 1.", level: .error)
                                }
                                })
                            .font(.largeTitle)
                                .labelStyle(.iconOnly)
                            
                            // add right
                            Button("Add Stroke", systemImage: "plus.circle.fill", action:
                                    {
                                logger.log("Adding to score", level: .info)
                                scoreHaptic.impactOccurred()
                                self.score += 1
                                })
                            .font(.largeTitle)
                                .labelStyle(.iconOnly)
                                
                        }
                    }
                    Spacer()
                }
                    .frame(maxHeight: .infinity)
            )
    }
}

#Preview {
    NavigationView {
        VStack(spacing: 20) {
            HoleScoringView(hole: PreviewData.Holes.parThree, round: PreviewData.goodRound)
            HoleScoringView(hole: PreviewData.Holes.parFour, round: PreviewData.badRound)
            HoleScoringView(hole: PreviewData.Holes.parFive, round:PreviewData.completedPar)
        }
        .padding()
    }
}
