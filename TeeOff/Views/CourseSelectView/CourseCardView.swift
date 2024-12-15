//
//  CourseCardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-02.
//

// TODO: Fix Yardages
// TODO: Fix Navigation


import Foundation
import SwiftUI

struct CourseCardView: View {
    
    let course: CourseViewModel
    private let logger = Logger(origin: "CourseCardView")
    
    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(2.5, contentMode: ContentMode.fit)
            .padding(.horizontal, 10)
            .overlay(
                HStack {
                    
                    // Left: Course info and yardages
                    courseInfo
                    
                    // Right: Par and actions
                    VStack (alignment: .center) {
                        Spacer()
                        parDisplay
                        Spacer()
                        viewButton
                        Spacer()
                    }
                }
                    .padding(.horizontal, 25)
            ) // overlay
    }
    
    // MARK: - Components
    
    // Identifiers and Yardages
    private var courseInfo: some View {
        VStack(alignment: .leading) {
            Spacer()
            courseIdentifiers
            Divider()
            courseYardages
            Spacer()
            
        }
    }
    
    // Name and address
    private var courseIdentifiers: some View {
        VStack(alignment: .leading) {
            Text(course.name)
                .font(.title2)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .minimumScaleFactor(0.5)
            
            Text(course.address)
                .multilineTextAlignment(.leading)
                .font(.caption)
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
        }
    }
    
    // Yardage indicators
    private var courseYardages: some View {
        VStack {
            YardageView(course.totalBlues, .blue)
            YardageView(course.totalWhites, .white)
            YardageView(course.totalReds, .red)
        }
    }
    
    // Par for the course
    private var parDisplay: some View {
        Text("\(course.totalPar)")
            .font(.title)
            .fontWeight(.medium)
            .frame(alignment: .topTrailing)
    }
    
    // 'View' Button to CourseDetailView
    private var viewButton: some View {
        NavigationLink(destination: CourseDetailView(course: course)) {
            Label(
                "View",
                systemImage: "menucard"
            )
        }
        .font(.system(size: 18))
        .buttonStyle(.borderedProminent)
        .onTapGesture {
            logger.log("Navigating to: \(course.name) Details", level: .info)
        }
    }
}
    
    
// MARK: - Preview
#Preview {
    NavigationView {
        VStack(spacing: 20) {
            CourseCardView(course: CourseViewModel(course: PreviewData.Courses.sample))
        }
        .padding()
    }
}

