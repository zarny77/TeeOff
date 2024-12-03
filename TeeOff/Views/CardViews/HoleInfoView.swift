//
//  HoleInfoView.swift
//  TeeOff
//
// View only version of HoleCardView
//
//  Created by Dylan Zarn on 2024-12-02.
//

import SwiftUI

struct HoleInfoView: View {
    
    var hole: Hole
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(2.5, contentMode: ContentMode.fit)
            .padding(.horizontal, 10)
            .overlay(
                HStack(alignment: .center) {
                    Spacer()
                    // left stack: hole #, par, yardages
                        
                    VStack (alignment: .leading, spacing: 2 ){

                        
                        Text(String(hole.id))
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundStyle(.green)
                        
                        // par and yardages
                        Text("Par: " + String(hole.par))
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                        
                        VStack(alignment: .leading, spacing: 2) {
                            YardageView(yds: hole.blues, pin: Color.blue)
                            YardageView(yds: hole.whites, pin: Color.white)
                            YardageView(yds: hole.reds, pin: Color.red)
                        }
                        Spacer()
                    }
                 
                    .frame(maxHeight: .infinity)
            )
    }
}

#Preview {
    HoleInfoView(hole: CourseRepository.shared.courses[0].holes[0])
}
