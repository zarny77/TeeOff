//
//  round.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-05.
//

import Foundation

struct round {
    
    let course: course
    var scores: [Int] = []
    let date: Date
    
    init(course: course, date: Date) {
        self.course = course
        self.date = Date()
    }
    
}
