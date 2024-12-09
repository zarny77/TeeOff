//
//  CourseCardViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-26.
//

import Foundation
import SwiftUI

struct CourseCardViewModel {
    let course: CourseModel
    
    init(course: CourseModel) {
        self.course = course
    }
    
    // Basic details
    var name: String { course.id }
    var address: String { course.address }
    
    // Total Par and string format
    var parDisplay: String { "Par \(course.par)"}
    
    // Yardages
    var blues: Int { course.blues }
    var whites: Int { course.whites }
    var reds: Int { course.reds }
    
    // Yardage properties for generating YardageViews
    var yardageData: [(yardage: Int, color: Color)] {
        [
            (course.blues, .blue),
            (course.whites, .white),
            (course.reds, .red)
        ]
    }
    
    var holeCount: Int { course.holes.count }
    var courseType: String { holeCount == 9 ? "9 Hole" : "18 Hole" }
    
    // Par computed properties
    var frontPar: Int { course.frontPar }
    var backPar: Int { course.backPar }
    
}
