//
//  ScorecardView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI
import SwiftData

struct RoundSummaryView: View {
        
    // MARK: - Properties
    let columnLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    private let logger = Logger(origin: "RoundSummaryView")
    @Bindable var round: RoundViewModel
    
    // MARK: - Body
    var body: some View {
        
        ScrollView{
            SummaryDetailsView(round: round)
            scorecardGrid
        }
    }
    
    // MARK: - Components
    
    private var scorecardGrid: some View {
        LazyVGrid(
            columns: columnLayout, spacing: 10, content:  {
                ForEach(round.course.holes) { hole in
                    ScoredHoleView(
                        hole: hole,
                        score: round.scoreForHole(hole.id-1),
                        played: round.isHolePlayed(hole.id-1)
                    )
                }
            }
        )
        .padding(.horizontal, 10)
    }
}

// MARK: - Preview

#Preview {
    RoundSummaryView(round: PreviewData.goodRoundViewModel)
}
