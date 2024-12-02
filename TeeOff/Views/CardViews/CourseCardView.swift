//
//  CourseCardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-02.
//

import Foundation
import SwiftUI

struct CourseCardView: View {
    
    @ObservedObject var viewModel: CourseCardViewModel
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(2.5, contentMode: ContentMode.fit)
            .padding(.horizontal, 10)
            .overlay(
                
                // Title and yardages left, par and view SC right
                HStack(content: {
                    
                    // Title and yardages
                    VStack(alignment: .leading, content: {
                        
                        Spacer() // upper brace
                        
                        // title
                        VStack(alignment: .leading, content: {
                            Text(viewModel.name)
                                .font(.title2)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                                .frame(alignment: .topLeading)
                            Text(viewModel.address)
                                .multilineTextAlignment(.leading)
                                .font(.caption)
                                .fontWeight(.bold)
                            ForEach(viewModel.yardageData, id: \.0) {
                                yardage, color in YardageView(yds: yardage, pin: color)
                            }
                        })
                    
                    // middle spacer
                    Spacer()
                    
                    // par & scorecard sections
                    VStack (alignment: .center, content: {
                        
                        // top brace
                        Spacer()
                        
                        Text("Par " + String(course.par))
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(alignment: .topTrailing)
                        
                        Spacer()
                        
                        HStack{
                            
                            Button("Play Golf!", systemImage: "menucard", action:{})
                                .font(.system(size: 35))
                                .labelStyle(.iconOnly)
                            
                            Button("Play Golf!", systemImage: "figure.golf.circle", action:{})
                                .font(.system(size: 40))
                                .labelStyle(.iconOnly)
                        }
                        
                        // bottom brace
                        Spacer()
                    })
                    
                })
                .padding(.horizontal, 25)
            ) // overlay
    }
}
#Preview {
    CourseCardView(course: StB)
}

