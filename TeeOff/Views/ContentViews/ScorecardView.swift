//
//  ScorecardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI



struct ScorecardView: View {
        
    // define column count and spacing
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var course: Course
    
    init(course: Course) {
        self.course = course
    }
    
    var body: some View {
        
            // hole chip generator
            ScrollView {
                LazyVGrid(columns: columnLayout, spacing: 10, content:  {
                    ForEach(course.holes) { hole in
                        HoleCardView(hole: hole)
                    }
                })
                .padding(.horizontal, 10)
                
            }
        }

}

#Preview {
    ScorecardView(course: Maplewood)
}
