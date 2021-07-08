//
//  PowerupListView.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

let allPowerUps = [
    // Define all available powerups
    PowerUp(name: "Quarter to Half", description: "Get between and ¼ and ½ of current score", cost: 50, effect: "halfToDouble"),
    PowerUp(name: "Tappy +1", description: "Get +1 per tap", cost: 100, effect: "multiplier"),
    PowerUp(name: "Magic Scroll", description: "Get points by scrolling the Digital Crown for 5 seconds", cost: 200, effect: "magicScroll"),
    PowerUp(name: "Double or Nothing", description: "Get double or lose everything", cost: 300, effect: "doubleOrNothing"),
]

struct PowerupListView: View {
    @Binding var isShowingSheet: Bool
    @Binding var currentScore: Int
    @Binding var scoreMultiplier: Int
    
    var body: some View {
        List {
            ForEach(allPowerUps) { powerUp in
                PowerupItem(isShowingSheet: $isShowingSheet, currentScore: $currentScore, scoreMultiplier: $scoreMultiplier, powerUp: powerUp)
            }
            #warning("TODO: Tenhle text dát doprostřed")
            #warning("TODO: A tohle taky zatím nic nedělá")
            Text("Try taking a screenshot :)")
                .foregroundColor(.accentColor)
                .listRowBackground(Color.black)
        }
    }
}
