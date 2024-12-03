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
    
    var course: Course
    
    var body: some View {
        ScrollView {
            
            courseOverviewSection
            
            holeGridSection
        }
        .navigationTitle("\(course.id)")
    }
    
    private var courseOverviewSection: some View  {
        GroupBox("Course Overview") {
            VStack(alignment: .leading, spacing: 12) {
                // Basic info
                Label(course.address, systemImage: "location.fill")
                    .font(.subheadline)
                
                Divider()
                
                // Course Type and Details
                HStack {
                    VStack(alignment: .leading) {
                        courseStat("Total Par", String(course.par))
                        courseStat("Front", String(course.frontPar))
                        courseStat("Back", String(course.backPar))
                    }
                    
                Spacer()
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        
                        teeInfoRow("Blue", course.blues, "Championship")
                        teeInfoRow("White", course.whites, "Member")
                        teeInfoRow("Red", course.reds, "Forward")
                    }
                    
                }
               
                Divider()
                
                
            }
        }
    }
    
    
    private var holeGridSection: some View {
        GroupBox {
            LazyVGrid(columns: columnLayout, spacing:10) {
                ForEach(course.holes) { hole in
                    HoleInfoView(hole: hole)
                }
            }
        }
    }
    
    private func courseStat(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Text(value)
                .fontWeight(.medium)
        }
        .font(.subheadline)
    }
    
    private func teeInfoRow(_ teeName: String, _ yards: Int, _ level: String) -> some View {
        HStack {
            Text(String(yards))
            Circle()
                .fill(teeColor(teeName))
                .frame(width: 10, height: 10)
        }
        .font(.subheadline)
    }
    
    private func teeColor(_ name: String) -> Color {
            switch name.lowercased() {
            case "blue": return .blue
            case "white": return .white
            case "red": return .red
            default: return .gray
            }
        }
    
    struct HoleDetailCardView: View {
        let hole: Hole
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Hole \(hole.id)")
                        .font(.headline)
                    Spacer()
                    Text("Par \(hole.par)")
                        .fontWeight(.medium)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    YardageView(yds: hole.blues, pin: .blue)
                    YardageView(yds: hole.whites, pin: .white)
                    YardageView(yds: hole.reds, pin: .red)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
}

#Preview {
    NavigationView {
        CourseDetailView(course: CourseRepository.shared.courses[0])
    }
}
