//
//  ScorecardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

let sbgc1: hole = hole(num: 1, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc2: hole = hole(num: 2, par: 4, blues: 365, whites: 326, reds: 310)
let sbgc3: hole = hole(num: 3, par: 4, blues: 365, whites: 326, reds: 310)
let sbgc4: hole = hole(num: 4, par: 4, blues: 375, whites: 366, reds: 352)
let sbgc5: hole = hole(num: 5, par: 3, blues: 186, whites: 178, reds: 162)
let sbgc6: hole = hole(num: 6, par: 4, blues: 375, whites: 366, reds: 352)
let sbgc7: hole = hole(num: 1, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc8: hole = hole(num: 1, par: 4, blues: 340, whites: 326, reds: 312)
let sbgc9: hole = hole(num: 1, par: 4, blues: 340, whites: 326, reds: 312)

let sbgcHoles: [hole] = [sbgc1,sbgc2,sbgc3,sbgc4,sbgc5,sbgc6,sbgc7,sbgc8,sbgc9]

let StB: course = course(name: "St. Boniface GC",
                         address: "100 Rue Youville, Winnipeg, MB",
                         blues: 6348,
                         whites: 6104,
                         reds: 5719,
                         par: 72,
                         holes: sbgcHoles)

struct ScorecardView: View {
        
    // define column numbers
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var course: course
    
    init(course: course) {
        self.course = course
    }
    
    var body: some View {
        
        // course name header
        Text(course.name)
            .font(.title)
            .fontWeight(.bold)
        // 
        ScrollView {
            LazyVGrid(columns: columnLayout) {
                
            }
        }
    }
}

#Preview {
    ScorecardView(course: StB)
}
