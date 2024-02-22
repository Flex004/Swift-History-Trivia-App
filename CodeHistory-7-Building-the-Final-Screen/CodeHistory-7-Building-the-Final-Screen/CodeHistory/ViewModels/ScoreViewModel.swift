//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by Felix Chadwick-Smith on 26/08/23.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
