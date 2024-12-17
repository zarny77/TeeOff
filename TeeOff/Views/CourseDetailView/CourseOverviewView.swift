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
    
    
    @Environment(\.modelContext) private var modelContext
    @State private var activeRound: RoundViewModel?
    @State private var showingSummary = false
    @State private var showingScorecard = false
    private let logger = Logger(origin: "CourseOverviewView")
    
    let course: CourseViewModel
    
    
    // MARK: - Body
    var body: some View  {
        GroupBox {
            VStack(alignment: .leading, spacing: 5) {
                headerSection
                Divider()
                statisticsSection
            }
        }
        .cornerRadius(12)
        .padding(.horizontal, 10)
        .navigationDestination(isPresented: $showingScorecard) {
            if let round = activeRound {
                ScorecardView(
                    round: round,
                    onFinish: {
                        logger.log("Round finished, showing summary")
                        showingScorecard = false
                        showingSummary = true
                    },
                    onCleanup: {
                        logger.log("Round Cleanup triggered")
                        showingScorecard = false
                        activeRound = nil
                    }
                )
            }
        }
        .navigationDestination(isPresented: $showingSummary) {
            if let round = activeRound {
                RoundSummaryView(round: round)
                    .onDisappear {
                        logger.log("Summary view disappeared, cleaning up")
                        showingSummary = false
                        activeRound = nil
                    }
                    .transition(.slide)
            }
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
                let round = RoundViewModel.createRound(for: course.courseModel, modelContext: modelContext)
                activeRound = round
                showingScorecard = true
                logger.log("Created new round at: \(course.name)", level: .info)
            } label: {
                Label("Start", systemImage:"figure.golf")
            }
            .font(.system(size: 13))
            .frame(width: 105)
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
    
    // MARK: - Statistics - Re-implement this when it's fixed
    
    private var statisticsSection: some View {
        HStack {
            VStack(alignment: .leading) {
                StatRow(label: "Par", value: "\(course.totalPar)")
                StatRow(label: "Front", value: "\(course.frontPar)")
                StatRow(label: "Back", value: "\(course.backPar)")
            }
            
            Spacer()
            
            // Put averages in here once rounds are handled again
        }
    }
    
}
    


#Preview {
    CourseOverviewView(course: CourseViewModel(course: PreviewData.Courses.sample))
}
