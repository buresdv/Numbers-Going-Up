//
//  Score.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import Foundation

class Score: ObservableObject {
    // Define a global variable that stores score
    // Call currentScore.score to access the value
    @Published var score: Int = 0
}

class ScoreMultiplier: ObservableObject {
    // Define a global variable that sets a multiplier for score that gets added on click
    // Call scoreMultiplier.multiplierValue to access the value
    @Published var multiplierValue: Int = 3
}
