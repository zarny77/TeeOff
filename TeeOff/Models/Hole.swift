//
//  hole.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import Foundation

struct Hole: Identifiable, Codable {
    
    let id: Int
    let par: Int
    private(set) var blues: Int
    private(set) var whites: Int
    private(set) var reds: Int
    
    init(id: Int, par: Int, blues: Int, whites: Int, reds: Int) {
        assert(par > 0 && par <= 5, "Par must be between 1 and 5")
        assert(id > 0 && id <= 18, "Hole numbers must be from 1 to 18")
        
        self.id = id
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
    }
}
