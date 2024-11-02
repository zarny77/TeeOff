//
//  CourseCardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-02.
//

import Foundation
import SwiftUI

struct CourseCardView: View {
    
    let course: course
    
    init(course: course) {
        self.course = course
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(2.25, contentMode: ContentMode.fit)
            .overlay(
                
                // Title and yardages left, par and view SC right
                HStack{
                    
//                    Spacer() // left brace
                    
                    // Title and yardages
                    VStack(alignment: .leading, content: {
                        
                        Spacer() // upper brace
                        
                        // title
                        VStack(alignment: .leading, content: {
                            Text(course.id)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .frame(alignment: .topLeading)
                            Text(course.address)
                                .multilineTextAlignment(.leading)
                                .font(.caption)
                        })
                        
                        Spacer() // middle brace
                        
                        // yardages
                        VStack(alignment: .leading, content: {
                            
                            YardageView(yds: course.blues, pin: Color.blue)
                            YardageView(yds: course.whites, pin: Color.white)
                            YardageView(yds: course.reds, pin: Color.red)
                            
                        })
                        .padding(.trailing, 125.0)
                        
                        Spacer() // bottom brace
                    })
                    
                    
                    Spacer()
                    
                    // par & scorecard sections
                    VStack (alignment: .trailing, content: {
                        
                        Spacer()
                        
                        Text("Par " + String(course.par))
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(alignment: .topTrailing)
                            .padding(.bottom, 55.0)
                        
                        Spacer()
                        
                        Button("Play Golf!", systemImage: "figure.golf.circle.fill", action:{})
                            .font(.largeTitle)
                            .labelStyle(.iconOnly)
                        
                        Spacer()
                    }) // par & SC
                
//                    Spacer()
                }) // overlay
    }
}

#Preview {
    CourseCardView(course: StB)
}
