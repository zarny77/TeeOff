//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct HoleScoreView: View {
    let hole: Hole
    let score: Int
    
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
                    VStack(alignment: .leading) {
                        
                        Spacer()
                        
                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                        
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        YardageView(yds: hole.blues, pin: .blue)
                        YardageView(yds: hole.whites, pin: .white)
                        YardageView(yds: hole.reds, pin: .red)
                        
                        Spacer()
                    }
                    // middle spacer
                    Spacer()
                    
                    // right stack: score and buttons
                    VStack(alignment: .center) {
                        Spacer()
                        
                        // Score relative to par marker
                        HStack{
                            Spacer()
                            if score > hole.par {
                                Text("+" + String(score - hole.par))
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundStyle(.red)
                            } else if score < hole.par {
                                Text("-" + String(hole.par - score))
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundStyle(.green)
                            }
                        }
                        
                        // Score
                        Text(String(score))
                            .font(.system(size: 100))
                            .fontWeight(.black)
                        
                        Spacer()
                    }
                    .padding(.vertical, 30)
                    
                    // right spacer
                    Spacer()
                }
                    .padding(.horizontal, 25)
            )
    }
}


#Preview {
    VStack {
        HoleScoreView(hole: PreviewData.Holes.parThree, score: 3)
    }
}
