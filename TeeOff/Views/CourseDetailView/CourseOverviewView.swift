//
//  CourseOverviewView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-07.
//

import SwiftUI
import SwiftData

struct CourseOverviewView: View {
    
    // MARK: - Properties
    
    let viewModel: CourseOverviewViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var shouldNavigate = false
    @State private var roundManager = RoundManagerViewModel.shared
    @State private var showingRoundConflictAlert = false
    
    private var hasActiveRoundAtThisCourse: Bool {
        guard let activeRound = roundManager.activeRound else { return false }
        return activeRound.course.id == viewModel.course.id
    }
    
    // MARK: - Body
    
    var body: some View  {
        GroupBox {
            VStack(alignment: .leading, spacing: 5) {
                headerSection
                Divider()
                statisticsSection
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
        .alert(
            "Active Round in Progress",
            isPresented: $showingRoundConflictAlert
        ) {
            Button("Continue Active Round", role: .cancel) {
                shouldNavigate = true
            }
            
            Button("Discard Active Round", role: .destructive) {
                if let activeRound = roundManager.activeRound {
                    modelContext.delete(activeRound)
                }
                roundManager.activeRound = nil
                handleRoundStart()
            }
        } message: {
            Text("You have an active round at \(roundManager.activeRound?.course.id ?? ""). \n\n Would you like to continue that round or discard it and start a new one?")
        }
    }
    
    // MARK: - Subviews
    
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Course Overview")
                    .font(.headline)
                    .padding(.vertical, 2)
                Label(viewModel.address, systemImage: "location.fill")
                    .font(.subheadline)
                    .frame(width: 241)
                    .minimumScaleFactor(0.5)
                
                HStack(spacing: 8) {
                    Text("Yardages")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(width: 65)
                    YardageView(viewModel.blues, .blue)
                    YardageView(viewModel.whites, .white)
                    YardageView(viewModel.reds, .red)
                }
                
            }
            .frame(width: 239)
            Spacer()
            
            startRoundButton
        }
    }
    
    private var startRoundButton: some View {
        VStack {
            Spacer()
            
            Button {
                handleRoundStart()
            } label: {
                Label(hasActiveRoundAtThisCourse ? "Continue" : "Start" ,
                      systemImage: hasActiveRoundAtThisCourse ? "arrow.right" : "figure.golf")
            }
            .font(.system(size: 13))
            .frame(width: 105)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
    
    private var statisticsSection: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(viewModel.parStats, id: \.label) { stat in
                    StatRow(label: stat.label, value: stat.value)
                }
            }
            Spacer()
            
            VStack(alignment: .trailing) {
                ForEach(viewModel.averageStats, id: \.label) { stat in
                    StatRow(label: stat.label, value: stat.value)
                }
            }
        }
    }
    
    
    // MARK: - Round Management
    
    private func handleRoundStart() {
        if let activeRound = roundManager.activeRound {
            print("Active round detected, checking course")
            if activeRound.course.id != viewModel.course.id {
                print("Different course accessed, should prompt for cancellation")
                showingRoundConflictAlert = true
            } else {
                print("Course with active round selected, navigating to active round")
                shouldNavigate = true
            }
        } else {
            print("No active round detected. Creating new round.")
            createNewRound()
        }
    }
    
    private func createNewRound() {
        let round = RoundModel(course: viewModel.course)
        modelContext.insert(round)
        print("Round created at course \(viewModel.course.id)")
        roundManager.activeRound = round
        shouldNavigate = true
        print("Active Round Set: \(String(describing: roundManager.activeRound))")
        print("Should Navigate: \(shouldNavigate)")
    }
    
}

#Preview {
    CourseOverviewView(viewModel: CourseOverviewViewModel(course: CourseRepository.shared.courses[0]))
}
