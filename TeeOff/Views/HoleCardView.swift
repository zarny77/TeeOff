//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

var test = hole(id: 18, par: 3, blues: 200, whites: 180, reds: 150)

struct HoleCardView: View {
    
    
    var hole: hole
    
    // determine if this can be saved / added later on
    @State var score: Int

    
    init(hole: hole) {
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
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                            .padding(.vertical, -1.0)
                        
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.vertical, -20.0)
                        
                        YardageView(yds: hole.blues, pin: Color.blue)
                        YardageView(yds: hole.whites, pin: Color.white)
                        YardageView(yds: hole.reds, pin: Color.red)
                    })
                    // middle spacer
                    Spacer()
                    
                    // right stack: score and buttons
                    VStack(alignment: .center, content: {
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
                        
                    })
                    // right spacer
                    Spacer()
                })
    }
}

#Preview {
    HoleCardView(hole: test)
}
