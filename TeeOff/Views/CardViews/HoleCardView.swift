//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct HoleCardView: View {
    
    var hole: Hole
    
    // determine if this can be saved / added later on
    @State var score: Int

    
    init(hole: Hole) {
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
                    VStack(alignment: .leading) {
                        
                        
                        
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 2) {
                            YardageView(hole.blues, Color.blue)
                            YardageView(hole.whites, Color.white)
                            YardageView(hole.reds, Color.red)
                        }
                        Spacer()
                    }
                

                    // right stack: score and buttons
                    VStack {
                        Text(String(score))
                            .font(.system(size: 100))
                            .fontWeight(.black)
                        
                        // buttons
                        HStack {
                            // subtract left
                            Button("Subtract Stroke", systemImage: "minus.circle.fill", action:
                                    {
                                self.score -= 1
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
//                    .padding(15)
                    .frame(maxHeight: .infinity)
            )
    }
}

#Preview {
    NavigationView {
        VStack(spacing: 20) {
            HoleCardView(hole: PreviewData.Holes.parThree)
            HoleCardView(hole: PreviewData.Holes.parFour)
            HoleCardView(hole: PreviewData.Holes.parFive)
        }
        .padding()
    }
}
