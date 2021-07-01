//
//  PowerupListView.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

let allPowerUps = [
    // Define all available powerups
    PowerUp(name: "Half to Double", description: "This is the first desc", cost: 50, effect: "halfToDouble"),
    PowerUp(name: "Multiplier +1", description: "Get +1 per tap", cost: 100, effect: "multiplier"),
    PowerUp(name: "Magic Scroll", description: "This is the second desc", cost: 200, effect: "magicScroll"),
    PowerUp(name: "Double or Nothing", description: "Get double or lose everything", cost: 300, effect: "doubleOrNothing"),
]

struct PowerupListView: View {
    @Binding var isShowingSheet: Bool
    @Binding var currentScore: Int
    var body: some View {
        List {
            ForEach(allPowerUps) { powerUp in
                PowerupItem(isShowingSheet: $isShowingSheet, currentScore: $currentScore, powerUp: powerUp)
            }
        }
    }
}
