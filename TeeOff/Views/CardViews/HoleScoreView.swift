//
//  HoleChipView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation
import SwiftUI

struct HoleScoreView: View {
    
    var hole: hole
    let score: Int

    
    init(hole: hole, score: Int) {
        self.hole = hole
        self.score = score
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
                        HStack{
                            Spacer()
                            if( score > hole.par )
                            {
                                Text("+" + String(score-hole.par))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundStyle(.red)
                                    .font(.title)
                                    .fontWeight(.heavy)
                                
                            }
                            else
                            {
                                Text("-" + String(hole.par-score))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundStyle(.green)
                                    .font(.title)
                                    .fontWeight(.heavy)
                            }
                        }
                        Text(String(score))
                            .font(.system(size: 100))
                            .fontWeight(.black)
                        
                        

                        Spacer()
                    })
                    .padding(.vertical, 30)
                    // right spacer
                    Spacer()
                })
    }
}

#Preview {
    HoleScoreView(hole: sbgcHoles[0], score: 3)
}
