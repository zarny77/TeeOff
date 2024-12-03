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
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(UIColor.secondarySystemBackground))
            .aspectRatio(2.5, contentMode: ContentMode.fit)
            .padding(.horizontal, 10)
            .overlay(
                HStack {
                    
                    // Left: Course info and yardages
                    VStack(alignment: .leading) {
                        Spacer() // upper brace
                        
                        // Course name and address
                        VStack(alignment: .leading) {
                            Text(viewModel.name)
                                .font(.title2)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                                .frame(alignment: .topLeading)
                            
                            Text(viewModel.address)
                                .multilineTextAlignment(.leading)
                                .font(.caption)
                                .fontWeight(.bold)
                            
                            // Yardages for each tee
                            ForEach(viewModel.yardageData, id: \.yardage) {
                                yardage, color in YardageView(yds: yardage, pin: color)
                            }
                        }
                        
                        // middle spacer
                        Spacer()
                    }
                    Spacer()
                    // Right: Par and actions
                    VStack (alignment: .center) {
                        Spacer()
                        
                        Text(viewModel.parDisplay)
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(alignment: .topTrailing)
                        
                        Spacer()
                        
                        HStack{
                            
                            NavigationLink(destination: ScorecardView(course: viewModel.course)) {
                                Image(systemName: "figure.golf.circle")
                                    .font(.system(size: 40))
                            }
                            
                            NavigationLink(destination: CourseDetailView(course: viewModel.course)) {
                                Image(systemName: "menucard")
                                    .font(.system(size: 40))
                            }
                        }
                        .foregroundStyle(.primary)
                    
                        Spacer()
                    }
                    
                }
                .padding(.horizontal, 25)
            ) // overlay
    }
}

#Preview {
    NavigationView {
        VStack(spacing: 20) {
            CourseCardView(viewModel: CourseCardViewModel(course: PreviewData.Courses.sample))
        }
        .padding()
    }
}

