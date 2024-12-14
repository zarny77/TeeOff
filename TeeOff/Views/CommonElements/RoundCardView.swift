//
//  SummaryDetailsView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-12.
//

import SwiftUI

struct RoundCardView: View {
    
    private let logger = Logger(origin: "RoundCardView")
    
    @Bindable var round: RoundModel
    
    private var scoreColour: Color {
        switch round.scoreRelativeToPar {
        case ..<0: return .green   // Under par
        case 0: return .blue       // Par
        case 1: return .orange     // Bogey
        default: return .red       // Double+
        }
    }
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    
                    roundDetails
                    Spacer()
                    scoreIndicator
                }
                Divider()
                    .padding(.top, -10)
                scoreBreakdown
            }
        }
        .cornerRadius(12)
        .padding(.horizontal, 10)
    }
    
    // MARK: - Components
    
    private var scoreIndicator: some View {
        VStack(alignment: .trailing) {
            VStack(spacing: -10) {
                HStack {
                    Spacer()
                    Text(String(round.scoreRelativeToParFormatted))
                        .foregroundStyle(scoreColour)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .frame(width: 85)
                HStack {
                    Text(String(round.totalScore))
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .minimumScaleFactor(0.5)
                }
                .frame(width: 100)
            }
        }
    }
    
    private var scoreBreakdown: some View {
        HStack {
            Text("Played \(round.holesPlayed)")
                .font(.subheadline)
            Spacer()
            StatRow(label: "Front", value: String(round.frontNine))
            Spacer()
            StatRow(label: "Back", value: String(round.backNine))
        }
    }
    
    private var roundDetails: some View {
        VStack(alignment: .leading) {
            Text(round.course.name)
                .font(.title3)
                .fontWeight(.bold)
            Label(round.dateFormatted(), systemImage: "calendar")
                .foregroundStyle(.secondary)
            Label(round.durationFormatted(), systemImage: "timer")
                .foregroundStyle(.secondary)
        }
    }
    
}


// MARK: - Preview
#Preview {
    RoundCardView(round: PreviewData.goodRound)
}
