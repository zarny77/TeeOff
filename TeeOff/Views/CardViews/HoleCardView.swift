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
        
        // background
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(1.0, contentMode: ContentMode.fit)
            .overlay(
                HStack {
                    // left spacer
                    Spacer()
                    
                    // left stack: hole #, par, yardages
                    VStack(alignment: .leading, content: {
                        
                        Spacer()
                        
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                        
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        YardageView(yds: hole.blues, pin: Color.blue)
                        YardageView(yds: hole.whites, pin: Color.white)
                        YardageView(yds: hole.reds, pin: Color.red)
                        
                        Spacer()
                    })
                    // middle spacer
                    Spacer()
                    
                    // right stack: score and buttons
                    VStack(alignment: .center, content: {
                        
                        Spacer()
                        
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
                        Spacer()
                    })
                    .padding(.vertical, 30)
                    // right spacer
                    Spacer()
                })
    }
}

#Preview {
    HoleCardView(hole: sbgcHoles[0])
}
