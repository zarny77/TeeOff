//
//  hole.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct hole: Identifiable {
    
    let id: Int
    let par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    
    init(id: Int, par: Int, blues: Int, whites: Int, reds: Int) {
        self.id = id
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
    }
}
