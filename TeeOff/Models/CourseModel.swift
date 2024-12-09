//
//  Course.swift
//  TeeOff
//
//  The model for the Course DS. 
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftData
import Foundation

@Model
class CourseModel {
    
    var id: String
    var address: String
    var blues: Int
    var whites: Int
    var reds: Int
    var par: Int
    @Relationship(deleteRule: .cascade) var holes: [HoleModel] = []
    
    init(id: String, address: String, blues: Int, whites: Int, reds: Int, par: Int, holes: [HoleModel]) {
        self.id = id
        self.address = address
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.par = par
        self.holes = holes
    }
    
    // Course Yardage total
    
    var totalBlues: Int {
        holes.reduce(0) { $0 + $1.blues }
    }
 
    var totalWhites: Int {
        holes.reduce(0) { $0 + $1.whites }
    }
    
    var totalReds: Int {
        holes.reduce(0) { $0 + $1.reds }
    }
    
    // Course yardage totals front 9
    
    var frontBlues: Int {
        holes.prefix(9).reduce(0) { $0 + $1.blues }
    }
    
    var frontWhites: Int {
        holes.prefix(9).reduce(0) { $0 + $1.whites }
    }
    
    var frontReds: Int {
        holes.prefix(9).reduce(0) { $0 + $1.reds }
    }
    
    // Course yardage totals back 9
    
    var backBlues: Int {
        holes.suffix(9).reduce(0) { $0 + $1.blues }
    }
    
    var backWhites: Int {
        holes.suffix(9).reduce(0) { $0 + $1.whites }
    }
    
    var backReds: Int {
        holes.suffix(9).reduce(0) { $0 + $1.reds }
    }
    
    // Par totals
    
    var frontPar: Int {
        holes.prefix(9).reduce(0) { $0 + $1.par }
    }
    
    var backPar: Int {
        holes.suffix(9).reduce(0) { $0 + $1.par }
    }

}
