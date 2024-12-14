//
//  CourseViewModel.swift
//  TeeOff
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
    private(set) var selectedTee: TeeColor = .blue
    
    // MARK: - Computed Properties
    
    // Basics
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
    var totalYardage: Int {
        switch selectedTee {
        case .blue:
            return course.totalBlues
        case .white:
            return course.totalWhites
        case .red:
            return course.totalReds
        }
    }
    
    var frontNineYardage: Int {
        switch selectedTee {
        case .blue:
            return course.frontBlues
        case .white:
            return course.frontWhites
        case .red:
            return course.frontReds
        }
    }
    
    var backNineYardage: Int {
        switch selectedTee {
        case .blue:
            return course.backBlues
        case .white:
            return course.backWhites
        case .red:
            return course.backReds
        }
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
    
    // MARK: - Methods
    func changeTee(to color: TeeColor) {
        selectedTee = color
    }
}

// MARK: - TeeColor
enum TeeColor {
    case blue
    case white
    case red
    
    var name: String {
        switch self {
        case .blue:
            return "Blue"
        case .white:
            return "White"
        case .red:
            return "Red"
        }
    }
}
