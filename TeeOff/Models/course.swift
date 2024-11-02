//
//  course.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct course {
    
    var name: String
    var address: String
    var blues: Int
    var whites: Int
    var reds: Int
    var par: Int
    var holes: [hole] = []
    
    init(name: String, address: String, blues: Int, whites: Int, reds: Int, par: Int, holes: [hole]) {
        self.name = name
        self.address = address
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.par = par
        self.holes = holes
    }
    
}
