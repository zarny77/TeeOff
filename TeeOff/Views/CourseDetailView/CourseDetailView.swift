//
//  CourseDetailView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct CourseDetailView: View {
    
    // define column count and spacing
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var course: CourseModel
    
    var body: some View {
            ScrollView {
                
                CourseOverviewView(viewModel: CourseOverviewViewModel(course: course))
                holeGridSection
            }
            .navigationTitle("\(course.id)")
        }

    // MARK: - Subview
    
    private var holeGridSection: some View {
        
        VStack(alignment: .leading)
        {
            Text("Average Scores")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal, 12)
                .padding(.vertical, -3)
            Divider()
            LazyVGrid(columns: columnLayout, spacing: 10) {
                ForEach(course.holes) { hole in
                    ScoredHoleView(hole: hole, score: hole.par)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
}

#Preview {
    NavigationView {
        CourseDetailView(course: CourseRepository.shared.courses[0])
    }
}
