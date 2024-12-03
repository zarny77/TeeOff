//
//  RoundStorage.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-02.
//

import Foundation

class RoundStorage: ObservableObject {
    
    // single shared instance
    static let shared = RoundStorage()
    
    @Published private(set) var rounds: [Round] = []
    
    var fullRounds: [Round] {
        rounds.filter { $0.isComplete }
    }
    
    var partialRounds: [Round] {
        rounds.filter { $0.isPartial }
    }
    
    // UserDefaults for storage keys and access
    private let userDefaults = UserDefaults.standard
    private let roundsKey = "saved_rounds"
    
    // prevent additional instances
    private init() {
        loadRounds()
    }
    
    // adds new rounds to the array
    // saves rounds to storage
    func saveRound(_ round: Round) {
        if round.holesPlayed > 0 {
            rounds.append(round)
            saveRoundsToStorage()
        }
    }
    
    // loads saved data when the app is opened
    private func loadRounds() {
        guard let data = userDefaults.data(forKey: roundsKey),
              let decodedRounds = try? JSONDecoder().decode([Round].self, from: data) else {
            return
        }
        rounds = decodedRounds
    }
    
    // encodes to JSON and saves to UserDefaults
    private func saveRoundsToStorage() {
        guard let encodedData = try? JSONEncoder().encode(rounds) else { return }
        userDefaults.set(encodedData, forKey: roundsKey)
    }
    
}
