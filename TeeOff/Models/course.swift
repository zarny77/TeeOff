//
//  course.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct course: Identifiable {
    
    var id: String
    var address: String
    var blues: Int
    var whites: Int
    var reds: Int
    var par: Int
    var holes: [hole] = []
    
    init(id: String, address: String, blues: Int, whites: Int, reds: Int, par: Int, holes: [hole]) {
        self.id = id
        self.address = address
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.par = par
        self.holes = holes
    }
    
}
