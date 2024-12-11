//
//  CourseCardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-02.
//

import Foundation
import SwiftUI

struct CourseCardView: View {
    
    let viewModel: CourseCardViewModel
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
            Text(viewModel.name)
                .font(.title2)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .minimumScaleFactor(0.5)
            
            Text(viewModel.address)
                .multilineTextAlignment(.leading)
                .font(.caption)
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
        }
    }
    
    // Yardage indicators
    private var courseYardages: some View {
        ForEach(viewModel.yardageData, id: \.yardage) {
            yardage, color in YardageView( yardage, color)
        }
    }
    
    // Par for the course
    private var parDisplay: some View {
        Text(viewModel.parDisplay)
            .font(.title)
            .fontWeight(.medium)
            .frame(alignment: .topTrailing)
    }
    
    // 'View' Button to CourseDetailView
    private var viewButton: some View {
        NavigationLink(destination: CourseDetailView(course: viewModel.course)) {
            Label(
                "View",
                systemImage: "menucard"
            )
            
        }
        .font(.system(size: 18))
        .buttonStyle(.borderedProminent)
        .onTapGesture {
            logger.log("Navigating to: \(viewModel.course.id) Details", level: .info)
        }
    }
}


// MARK: - Preview
#Preview {
    NavigationView {
        VStack(spacing: 20) {
            CourseCardView(viewModel: CourseCardViewModel(course: PreviewData.Courses.sample))
        }
        .padding()
    }
}

