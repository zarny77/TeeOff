//
//  CourseOverviewView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-07.
//

import SwiftUI
import SwiftData

struct CourseOverviewView: View {
    
    let viewModel: CourseOverviewViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var shouldNavigate = false
    
    @State private var roundManager = RoundManagerViewModel.shared
    
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
                        
                        Button {
                            if roundManager.activeRound == nil {
                                createNewRound()
                            }
                            shouldNavigate = true
                        } label: {
                            Label("Start", systemImage: "figure.golf")
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
        .navigationDestination(isPresented: $shouldNavigate) {
            if let round = roundManager.activeRound {
                ScorecardView(round: round)
            }
        }
    }

    
    // MARK: - Round Creation
    
    private func createNewRound() {
        let round = RoundModel(course: viewModel.course)
        modelContext.insert(round)
        print("Round created at course \(viewModel.course.id)")
        roundManager.activeRound = round
        shouldNavigate = true

        print("Active Round Set: \(String(describing: roundManager.activeRound))")
        print("Should Navigate: \(shouldNavigate)")
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
