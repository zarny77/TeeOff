//
//  ContentView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            CourseSelectView()
            .navigationTitle("Search Courses")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
