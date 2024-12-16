//
//  ScorecardView.swift
//  TeeOff
//
//  Used for scoring a round
//  Displayed following a round start in CourseDetailView
//  Persists until a round is saved or discarded
//
//  Created by Dylan Zarn on 2024-11-01.
//

// TODO: Fix ModelContext

import SwiftUI
import SwiftData

struct ScorecardView: View {
    // MARK: - Properties
    
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    private let logger = Logger(origin: "ScorecardView")
    
    @Bindable var round: RoundViewModel
        
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingFinishConfirmation = false
    @State private var navigateToSummary = false
    @State private var roundManager = RoundManager.shared

    // MARK: - Body
    var body: some View {
        ScrollView{
            scorecardGrid
            finishButton
        }
    }
    
    // MARK: - Components
    
    // shows the HoleScoringView for each hole in a grid
    private var scorecardGrid: some View {
        LazyVGrid(
            columns: columnLayout, spacing: 10, content:  {
                ForEach(round.course.holes) { hole in
                    HoleScoringView(hole: hole, round: round)
                }
            }
        )
        .padding(.horizontal, 10)
    }
    
    // Used to save or discard a round.
    // TODO: Change to work with new ViewModel
    private var finishButton: some View {
        HStack(spacing: 10) {
            Button {
                showingFinishConfirmation = true
                logger.log("'Finish Round' pressed", level: .info)
            } label: {
                Label("Finish Round", systemImage: "flag.checkered.circle.fill")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
            }
            .buttonStyle(.bordered)
            .padding(.horizontal, 10)
            .foregroundStyle(.green)
        }
        .navigationTitle(round.course.name)
        .navigationBarTitleDisplayMode(.automatic)
        .confirmationDialog(
            "Finish Round",
            isPresented: $showingFinishConfirmation,
            titleVisibility: .automatic
        ) {
            Button("Save", role: .none) {
                roundManager.activeRound?.finishRound()
                roundManager.activeRound = nil
                navigateToSummary = true
                logger.log("Saved round", level: .success)
            }
            
            Button("Discard", role: .destructive) {
                round.deleteRound()
                roundManager.activeRound = nil
                dismiss()
                logger.log("Round Deleted", level: .success)
            }
        } message: {
            Text("Save this round?")
                .font(.title)
        }
        .navigationDestination(isPresented: $navigateToSummary) {
            RoundSummaryView(round: round)
        }
    }
}

// MARK: - Preview

#Preview {
    ScorecardView(round: PreviewData.goodRoundViewModel)
}
