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
                    // left stack: hole #, par, yardages
                    VStack(alignment: .leading) {
                        

                        Text(String(hole.id))
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                            .minimumScaleFactor(0.5)
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        // yds
                        VStack(alignment: .leading, spacing: 2) {
                            YardageView(hole.blues, .blue)
                            YardageView(hole.whites, .white)
                            YardageView(hole.reds, .red)
                        }
                        Spacer()
                    }

                    Spacer()
                    // right stack: score and over/under indicator
                    VStack {
                        
                        // Score relative to par marker
                        HStack{

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
                            .font(.system(size: 80))
                            .fontWeight(.black)
                    }
                    .padding(.vertical, 30)

                }
                .padding(.horizontal, 20)
            )
    }
}


#Preview {
    VStack {
        HoleScoreView(hole: PreviewData.Holes.parThree, score: 3)
    }
}
