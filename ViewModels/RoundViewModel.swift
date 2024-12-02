//
//  RoundViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-08.
//

import Foundation

class RoundViewModel: ObservableObject {
    @Published private(set) var round: Round
    
    init(course: Course)
    {
        self.round = TeeOff.Round(course: course)
    }
    
    var scores: [Int] {round.scores}
    
}
