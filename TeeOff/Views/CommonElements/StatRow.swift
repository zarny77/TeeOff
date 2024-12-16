//
//  StatRow.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-09.
//

import SwiftUI

struct StatRow: View {
    
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Text(value)
                .bold()
        }
        .font(.subheadline)
    }
}

#Preview {
    StatRow(label: "Average", value: "92")
}
