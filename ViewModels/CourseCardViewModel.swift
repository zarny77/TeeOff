//
//  CourseCardViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-26.
//

import Foundation
import SwiftUI

struct CourseCardViewModel  {
    let course: Course
    
    init(course: Course) {
        self.course = course
    }
    
    var name: String { course.id }
    var address: String { course.address }
    
    var parDisplay: String { "Par \(course.par)"}
    
    var blues: Int { course.blues }
    var whites: Int { course.whites }
    var reds: Int { course.reds }
    
    var yardageData: [(yardage: Int, color: Color)] {
        [
            (course.blues, .blue),
            (course.whites, .white),
            (course.reds, .red)
        ]
    }
    
    var frontPar: Int { course.frontPar }
    var backPar: Int { course.backPar }
    
}
