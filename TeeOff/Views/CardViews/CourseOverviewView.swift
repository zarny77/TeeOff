//
//  CourseOverviewView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-07.
//

import SwiftUI

struct CourseOverviewView: View {
    
    let viewModel: CourseOverviewViewModel
    
    var body: some View  {
        GroupBox {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    // Basic info
                    VStack(alignment: .leading) {
                        Text("Course Overview")
                            .font(.headline)
                            .padding(.vertical, 2)
                        Label(viewModel.address, systemImage: "location.fill")
                            .font(.subheadline)
                        HStack(spacing: 8) {
                            Text("Yardages")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            YardageView(viewModel.blues, .blue)
                            YardageView(viewModel.blues, .white)
                            YardageView(viewModel.reds, .red)
                        }
                    }
                    Spacer()
                    
                    // Start Round Buttton
                    VStack {
                        Spacer()
                        
                        NavigationLink(
                            destination: ScorecardView(course: viewModel.course)) {
                            Label(
                                "Start",
                                systemImage: "figure.golf")
                        }
                            .font(.system(size: 13))
                            .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
                Divider()
                
                // Par details
                HStack {
                    VStack(alignment: .leading) {
                        courseStat("Total Par", String(viewModel.course.par))
                        courseStat("Front", String(viewModel.frontPar))
                        courseStat("Back", String(viewModel.backPar))
                    }
                Spacer()
                    // Personal Averages
                    VStack(alignment: .trailing) {
                        courseStat("Average", "92")
                        courseStat("Avg Front", "45")
                        courseStat("Avg Back", "47")
                    }
                }
                Divider()
            }
        }
        .cornerRadius(12)
        .padding(.horizontal, 10)
    }
    
    // MARK: - Subview
    
    private func courseStat(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Text(value)
                .fontWeight(.medium)
        }
        .font(.subheadline)
    }
}


#Preview {
    CourseOverviewView(viewModel: CourseOverviewViewModel(course: CourseRepository.shared.courses[0]))
}