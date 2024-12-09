//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct ScoredHoleView: View {
    let hole: HoleModel
    let score: Int
    
    private var scoreRelativeToPar: Int { score - hole.par }
    
    private var scoreColour: Color {
        if score == 0 { return .primary }
        switch scoreRelativeToPar {
        case ..<0: return .green   // Under par
        case 0: return .primary    // Par
        case 1: return .orange     // Bogey
        default: return .red       // Double+
        }
    }

    var body: some View {
        
        // background
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .overlay(
                HStack {
                    // left stack: hole #, par, yardages
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                            .minimumScaleFactor(0.5)
                            .frame(height: 60)
                        
                        Divider()
                            .padding(.vertical, -3)
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Divider()
                            .padding(.vertical, -3)
                        
                        // yds
                        VStack(alignment: .leading, spacing: 2) {
                            YardageView(hole.blues, .blue)
                            YardageView(hole.whites, .white)
                            YardageView(hole.reds, .red)
                        }
                        
                        Spacer()
                        
                    }
                    .frame(width: 60)
                    .padding(.vertical, 10)
                    
                    Spacer()
                    // right stack: score and over/under indicator
                    VStack(spacing: -15) {
                        
                        // Score relative to par marker
                        HStack {
                            Spacer()
                            Text(scoreRelativeToPar == 0 ? "E" :
                                    scoreRelativeToPar > 0 ? "+\(scoreRelativeToPar)" :
                                    "\(scoreRelativeToPar)")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundStyle(scoreColour)
                            .frame(height: 20)
                        }
                    
                    // Score
                        Text(String(score))
                            .font(.system(size: 80))
                            .fontWeight(.black)
                            .frame(minWidth: 100)
                            .frame(height: 100)
                            .minimumScaleFactor(0.5)

                    }
                }
                .padding(.horizontal, 20)
            )
    }
}


#Preview {
    VStack {
        ScoredHoleView(hole: PreviewData.Holes.parThree, score: 5)
    }
}
