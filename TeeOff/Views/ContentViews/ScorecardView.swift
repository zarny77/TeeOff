//
//  ScorecardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

let sbgc1: hole = hole(id: 1, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc2: hole = hole(id: 2, par: 4, blues: 365, whites: 326, reds: 310)
let sbgc3: hole = hole(id: 3, par: 4, blues: 365, whites: 326, reds: 310)
let sbgc4: hole = hole(id: 4, par: 4, blues: 375, whites: 366, reds: 352)
let sbgc5: hole = hole(id: 5, par: 3, blues: 186, whites: 178, reds: 162)
let sbgc6: hole = hole(id: 6, par: 4, blues: 375, whites: 366, reds: 352)
let sbgc7: hole = hole(id: 7, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc8: hole = hole(id: 8, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc9: hole = hole(id: 9, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc10: hole = hole(id: 10, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc11: hole = hole(id: 11, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc12: hole = hole(id: 12, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc13: hole = hole(id: 13, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc14: hole = hole(id: 14, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc15: hole = hole(id: 15, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc16: hole = hole(id: 16, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc17: hole = hole(id: 17, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc18: hole = hole(id: 18, par: 4, blues: 340, whites: 326, reds: 312)


let sbgcHoles: [hole] = [sbgc1,sbgc2,sbgc3,sbgc4,sbgc5,sbgc6,sbgc7,sbgc8,sbgc9,sbgc10,sbgc11,sbgc12,sbgc13,sbgc14,sbgc15,sbgc16,sbgc17,sbgc18]

let StB: course = course(id: "St. Boniface GC",
                         address: "100 Rue Youville, Winnipeg, MB",
                         blues: 6348,
                         whites: 6104,
                         reds: 5719,
                         par: 72,
                         holes: sbgcHoles)

let courseList: [course] = [StB]

struct ScorecardView: View {
        
    // define column count and spacing
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var course: course
    
    init(course: course) {
        self.course = course
    }
    
    var body: some View {
        
        // course name header
        Text(course.id)
            .font(.title)
            .fontWeight(.bold)
        
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
    ScorecardView(course: StB)
}
