//
//  ScorecardView.swift
//  HoleOut
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
    
    @State private var showingFinishConfirmation = false
    
    @Bindable var round: RoundViewModel
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let onFinish: () -> Void
    let onCleanup: () -> Void
    
    // MARK: - Body
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                scorecardGrid
                finishButton
            }
            .padding(.vertical)
        }
        .navigationTitle(round.course.name)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: showingFinishConfirmation) { oldValue, newValue in
            logger.log("showingFinishConfirmation changed from \(oldValue) to \(newValue)")
        }
        .confirmationDialog(
            "Finish Round",
            isPresented: $showingFinishConfirmation,
            titleVisibility: .visible
        ) {
            confirmationButtons
        } message : {
            Text("Would you like to save this round?")
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
    
    // Used to save or discard a round
    private var finishButton: some View {
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
    
    private var confirmationButtons: some View {
        Group {
            Button("Save") {
                finishRound()
            }
            
            Button("Discard", role: .destructive) {
                discardRound()
            }
            
            Button("Cancel", role: .cancel) {
                showingFinishConfirmation = false
            }
        }
    }
    
    // MARK: - Navigation Actions
    
    private func finishRound() {
        logger.log("Starting finishRound()")
        round.finishRound()
        logger.log("Round.finishRound() called")
        showingFinishConfirmation = false
        logger.log("Dismissed confirmation dialog")
        logger.log("Calling onFinish callback")
        withAnimation(.easeInOut) {
            onFinish()
        }
        logger.log("finishRound() completed")
    }
    
    private func discardRound() {
        round.deleteRound()
        onCleanup()
        logger.log("Round discarded")
    }
    
}

// MARK: - Preview

#Preview {
    ScorecardView(round: PreviewData.goodRoundViewModel, onFinish: {}, onCleanup: {})
}
