//
//  ScorecardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI
import SwiftData

struct ScorecardView: View {
        
    // define column count and spacing
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    @Bindable var round: RoundModel
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingFinishConfirmation = false
    @State private var roundManager = RoundManagerViewModel.shared
    
    var body: some View {
        
            // hole chip generator
            ScrollView {
                LazyVGrid(columns: columnLayout, spacing: 10, content:  {
                    ForEach(round.course.holes) { hole in
                        HoleScoringView(hole: hole, round: round)
                    }
                })
                .padding(.horizontal, 10)
                
                HStack(spacing: 10) {
                    Button {
                        showingFinishConfirmation = true
                        print("User Pressed Quit")
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
                .navigationTitle(round.course.id)
                .navigationBarTitleDisplayMode(.automatic)
                .confirmationDialog(
                    "Finish Round",
                    isPresented: $showingFinishConfirmation,
                    titleVisibility: .automatic
                ) {
                    Button("Save", role: .none) {
                        roundManager.activeRound = nil
                        dismiss()
                    }
                    
                    Button("Discard", role: .destructive) {
                        modelContext.delete(round)
                        roundManager.activeRound = nil
                        dismiss()
                        print("Round Successfully Deleted")
                    }
                } message: {
                    Text("Save this round?")
                        .font(.title)
                }
            }
            
        }
}

#Preview {
    ScorecardView(round: PreviewData.goodRound)
}
