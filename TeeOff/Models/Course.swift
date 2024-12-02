//
//  course.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct Course: Identifiable, Codable, Equatable {
    
    private(set) var id: String
    private(set) var address: String
    private(set) var blues: Int
    private(set) var whites: Int
    private(set) var reds: Int
    private(set) var par: Int
    private(set) var holes: [Hole] = []
    
    init(id: String, address: String, blues: Int, whites: Int, reds: Int, par: Int, holes: [Hole]) {
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
    
    // Course yardage front 9
    
    var frontBlues: Int {
        holes.prefix(9).reduce(0) { $0 + $1.blues }
    }
    
    var frontWhites: Int {
        holes.prefix(9).reduce(0) { $0 + $1.whites }
    }
    
    var frontReds: Int {
        holes.prefix(9).reduce(0) { $0 + $1.reds }
    }
    
    // Course yardage back 9
    
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
    
    // Forces equality to check ID's (name)
    
    static func ==(lhs: Course, rhs: Course) -> Bool {
        return lhs.id == rhs.id
    }
}
