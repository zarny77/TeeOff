//
//  RoundViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-08.
//

import Foundation

class RoundViewModel: ObservableObject {
    @Published private(set) var round: round
    
    init(course: course)
    {
        self.round = TeeOff.round(course: course)
    }
    
    var scores: [Int] {round.scores}
    
}
