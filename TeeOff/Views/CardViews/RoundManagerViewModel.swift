//
//  RoundManagerViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-09.
//

import Foundation
import SwiftData

@Observable class RoundManagerViewModel {
    static let shared = RoundManagerViewModel()
    var activeRound: RoundModel?
    
    private init() {}
}
