//
//  RoundManagerViewModel.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-12-09.
//

import Foundation
import SwiftUI

@Observable class RoundManager {
    static let shared = RoundManager()
    var activeRound: RoundModel?
    
    private init() {}
}
