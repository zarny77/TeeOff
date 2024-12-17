//
//  ContentView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

/*
 TODO: ViewModels
 FIXME: Round Persistence
 */

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var rounds: [RoundModel]
    
    var body: some View {
        NavigationStack {
            CourseSelectView()
        }
    }
}

#Preview {
    ContentView()
}
