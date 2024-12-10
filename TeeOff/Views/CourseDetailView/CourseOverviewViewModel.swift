//
//  CourseDetailViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-07.
//

import Foundation
import SwiftUI

struct CourseOverviewViewModel {
    
    let course: CourseModel
    
    init(course: CourseModel) {
        self.course = course
    }
    
    var name: String { course.id }
    var address: String { course.address }
    var parDisplay: String { "Par \(course.par)"}
    var frontPar: Int { course.frontPar }
    var backPar: Int { course.backPar }
    var blues: Int { course.blues }
    var whites: Int { course.whites }
    var reds: Int { course.reds }
    
    var parStats: [(label: String, value: String)] {
        [
            ("Total Par", String(course.par)),
            ("Front", String(frontPar)),
            ("Back", String(backPar)),
        ]
    }
    
    var averageStats: [(label: String, value: String)] {
        [
            ("Average", "92"),
            ("Avg. Front", "45"),
            ("Avg. Back", "47")
        ]
    }
    
    var yardageData: [(yardage: Int, color: Color)] {
        [
            (course.blues, .blue),
            (course.whites, .white),
            (course.reds, .red)
        ]
    }
}
