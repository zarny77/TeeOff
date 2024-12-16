//
//  hole.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

// TODO: Make HoleViewModel

import SwiftData
import Foundation

@Model
class HoleModel {
    var id: Int
    var par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    
    @Relationship(inverse: \CourseModel.holes) var course: CourseModel?
    
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
