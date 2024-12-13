//
//  ContentView.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-01.
//

/*
 FIXME: Selecting an active round from a different course alert causes the navigation to link back to the different course
 TODO: Active round indicators on CourseCardView
 TODO: build out stats view
 
 */

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            CourseSelectView()
    }
}

#Preview {
    ContentView()
}
