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
    
    // MARK: - Course Details
    var name: String { course.id }
    var address: String { course.address }
    var parDisplay: String { "Par \(course.par)"}

    // MARK: - Course Length Info
    var holeCount: Int { course.holes.count }
    var courseType: String { holeCount == 9 ? "9 Hole" : "18 Hole" }

    // MARK: - Yardage Data
    var yardageData: [(yardage: Int, color: Color)] {
        [
            (course.blues, .blue),
            (course.whites, .white),
            (course.reds, .red)
        ]
    }
}
