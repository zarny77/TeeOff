//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

var test = hole(num: 18, par: 3, blues: 200, whites: 180, reds: 150)

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
                        Text(String(hole.num))
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        YardageView(yds: hole.blues, pin: Color.blue)
                        YardageView(yds: hole.whites, pin: Color.white)
                        YardageView(yds: hole.reds, pin: Color.red)
                    })
                    
                    // middle spacer
                    Spacer()
                    
                    // right stack: score and buttons
                    VStack(alignment: .trailing, content: {
                        Text(String(score))
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        // buttons
                        HStack {
                            // add
                            Button("Add Stroke", systemImage: "arrow.up.circle", action:
                                    {
                                self.score += 1
                                })
                                .labelStyle(.iconOnly)
                            // subtract
                            Button("Subtract Stroke", systemImage: "arrow.down.circle", action:
                                    {
                                self.score -= 1
                                })
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
