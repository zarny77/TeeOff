//
//  CourseOverviewView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-07.
//

// TODO: Fix Course Par Statistics Block

import SwiftUI
import SwiftData

struct CourseOverviewView: View {
    
    private let logger = Logger(origin: "CourseOverviewView")
    
    let course: CourseViewModel
    
    // MARK: - Properties
    
    @State private var shouldNavigate = false
    @State private var roundManager = RoundManager.shared
    @State private var showingRoundConflictAlert = false
    
    private var hasActiveRoundAtThisCourse: Bool {
        guard let activeRound = roundManager.activeRound else { return false }
        return activeRound.course.name == course.name
    }
    
    // MARK: - Body
    
    var body: some View  {
        GroupBox {
            VStack(alignment: .leading, spacing: 5) {
                headerSection
                Divider()
//                statisticsSection
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
            Text("You have an active round at \(roundManager.activeRound?.course.name ?? "").\n\nWould you like to continue that round or discard it and start a new one?")
        }
    }
    
    // MARK: - Subviews
    
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Course Overview")
                    .font(.headline)
                    .padding(.vertical, 2)
                Label(course.address, systemImage: "location.fill")
                    .font(.subheadline)
                    .frame(width: 241)
                    .minimumScaleFactor(0.5)
                
                HStack(spacing: 8) {
                    Text("Yardages")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(width: 65)
                    YardageView(course.totalBlues, .blue)
                    YardageView(course.totalWhites, .white)
                    YardageView(course.totalReds, .red)
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
    
    // MARK: - Statistics - Re-implement this when it's fixed
    
//    private var statisticsSection: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                ForEach(course.parStats, id: \.label) { stat in
//                    StatRow(label: stat.label, value: stat.value)
//                }
//            }
//            Spacer()
//            
//            VStack(alignment: .trailing) {
//                ForEach(viewModel.averageStats, id: \.label) { stat in
//                    StatRow(label: stat.label, value: stat.value)
//                }
//            }
//        }
//    }
    
    
    // MARK: - Round Management
    
    private func handleRoundStart() {
        if let activeRound = roundManager.activeRound {
            logger.log("Active round detected, checking course")
            if activeRound.course.name != course.name {
                logger.log("Different course accessed, should prompt for cancellation")
                showingRoundConflictAlert = true
            } else {
                logger.log("Course with active round selected, navigating to active round")
                shouldNavigate = true
            }
        } else {
            logger.log("No active round detected. Creating new round.")
//            createNewRound()
        }
    }
    
//    private func createNewRound() {
//        let round = RoundViewModel
//        modelContext.insert(round)
//        
//        roundManager.activeRound = round
//        shouldNavigate = true
//        logger.log("Active Round Set: \(logger.formatOptional(roundManager.activeRound?.course.id)) - \(logger.formatOptional(roundManager.activeRound?.date.formatted(date: .abbreviated, time: .omitted)))")
//        logger.log("Should Navigate: \(shouldNavigate)")
//    }
    
}

#Preview {
    CourseOverviewView(course: CourseViewModel(course: PreviewData.Courses.sample))
}
