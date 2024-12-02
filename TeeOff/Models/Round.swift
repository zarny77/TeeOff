//
//  round.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-05.
//

import Foundation
import SwiftUI

struct Round: Identifiable, Codable {
    let id: UUID
    let course: Course
    var scores: [Int] = []
    let date: Date
    
    init(course: Course) {
        self.course = course
        self.date = Date()
    }
    
}
