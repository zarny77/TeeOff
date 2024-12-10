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
                        HoleScoringView(hole: hole)
                    }
                })
                .padding(.horizontal, 10)
            }
            
        }
}

#Preview {
    ScorecardView(round: PreviewData.goodRound)
}
