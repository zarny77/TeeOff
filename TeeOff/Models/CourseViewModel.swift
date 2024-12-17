//
//  CourseViewModel.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-13.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class CourseViewModel {
    // MARK: - Properties
    
    private var course: CourseModel
    
    // MARK: - Computed Properties
    
    // Basics
    var courseModel: CourseModel {
        course
    }
    
    var name: String {
        course.name
    }
    
    var address: String {
        course.address
    }
    
    var holes: [HoleModel] {
        course.holes
    }
    
    // Yardages
    var totalBlues: Int {
        course.totalBlues
    }
    
    var totalWhites: Int {
        course.totalWhites
    }
    
    var totalReds: Int {
        course.totalReds
    }
    
    var frontBlues: Int {
        course.frontBlues
    }
    
    var frontWhites: Int {
        course.frontWhites
    }
    
    var frontReds: Int {
        course.frontReds
    }
    
    var backBlues: Int {
        course.backBlues
    }
    
    var backWhites: Int {
        course.backWhites
    }
    
    var backReds: Int {
        course.backReds
    }
    
    // Par Info
    var totalPar: Int {
        course.par
    }
    
    var frontPar: Int {
        course.frontPar
    }
    
    var backPar: Int {
        course.backPar
    }
    
    // MARK: - Init
    init(course: CourseModel) {
        self.course = course
    }
}

