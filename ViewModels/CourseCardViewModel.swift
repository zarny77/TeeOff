//
//  CourseCardViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-26.
//

import Foundation
import SwiftUI

@Published
struct CourseCardViewModel  {
    let course: Course
    
    var name: String { course.id }
    var address: String { course.address }
    var parText: String { "Par \(course.par)" }
    var yardageData: [(Int, Color)] {
        [(course.blues, .blue), (course.whites, .white), (course.reds, .red)]
    }
}
