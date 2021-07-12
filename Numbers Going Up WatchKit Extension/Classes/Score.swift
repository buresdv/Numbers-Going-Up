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
    #warning("TODO: Tohle nastavit na 1 než to publikuju")
    @Published var multiplierValue: Int = 30
}

class ButtonTappedAmount: ObservableObject {
    // Define a global variable that stores how many times the Go Up! Button has been clicked
    // Used for playing sounds
    // Call buttonTappedAmount.tappedAmount to access the value
    @Published var tappedAmount: Int = 0
}
