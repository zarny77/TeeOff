//
//  HoleOutApp.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI
import SwiftData

@main
struct HoleOutApp: App {
    let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            container = try ModelContainer(for: RoundModel.self, CourseModel.self, HoleModel.self, configurations: config)
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error.localizedDescription)")
        }
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
