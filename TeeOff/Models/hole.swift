//
//  hole.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct hole {
    
    var num: Int
    let par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    
    init(num: Int, par: Int, blues: Int, whites: Int, reds: Int) {
        self.num = num
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
    }
}
