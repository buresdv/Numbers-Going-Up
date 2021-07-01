//
//  checkScore.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 30.06.2021.
//

import Foundation
import WatchKit

func checkScoreForEffects (currentScore: Int) -> Void {
    if currentScore % 50 == 0 {
        playSound(soundToPlay: .start) // Play this sound every 50 taps
    }
}
