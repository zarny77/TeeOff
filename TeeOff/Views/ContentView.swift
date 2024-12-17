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
        TabView {
            CourseSelectView()
                .tabItem {
                    Label("Courses", systemImage: "list.bullet")
                }
            RoundSelectView()
                .tabItem {
                    Label("Rounds", systemImage: "list.bullet")
                }  
        }
    }
}

#Preview {
    ContentView()
}
