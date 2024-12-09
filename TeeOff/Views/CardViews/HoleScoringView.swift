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
    
    // determine if this can be saved / added later on
    @State var score: Int

    
    init(hole: HoleModel) {
        self.hole = hole
        self.score = hole.par
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
                            .foregroundStyle(.green)
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
                        
                        // buttons
                        HStack {
                            // subtract left
                            Button("Subtract Stroke", systemImage: "minus.circle.fill", action:
                                    {
                                if score > 1 {
                                    self.score -= 1
                                }
                                })
                            .font(.largeTitle)
                                .labelStyle(.iconOnly)
                            
                            // add right
                            Button("Add Stroke", systemImage: "plus.circle.fill", action:
                                    {
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
            HoleScoringView(hole: PreviewData.Holes.parThree)
            HoleScoringView(hole: PreviewData.Holes.parFour)
            HoleScoringView(hole: PreviewData.Holes.parFive)
        }
        .padding()
    }
}
