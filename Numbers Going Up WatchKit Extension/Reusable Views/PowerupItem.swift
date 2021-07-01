//
//  PowerupItem.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

struct PowerupItem: View {
    
    @Binding var isShowingSheet: Bool
    @Binding var currentScore: Int
    
    var powerUp: PowerUp
    
    var body: some View {
        // Define how a single block of powerups looks
        HStack {
            VStack(alignment: .leading) {
                Text(powerUp.name)
                    .font(.headline)
                Text("-\(String(powerUp.cost))")
                    .font(.footnote)
                Text(powerUp.description)
                    .font(.subheadline)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .onTapGesture { // What happens when the player taps on a powerup
            // Check if the player has enough points to purchase the selected powerup
            #warning("TODO: Jestli mají dost boů zabarvit polčko zeleně, jestli ne, zabarvit červeně")
            print("Current score: \(currentScore)")
            if checkIfPlayerHasEnoughPoints(has: currentScore, needs: powerUp.cost) {
                // Close the powerups menu
                isShowingSheet = false
                
                // Define what happens on tap of a powerup
                chooseRightEffect(effectKey: powerUp.effect) // Calls applyEffect
                playSound(soundToPlay: .success)
                
                currentScore = currentScore - powerUp.cost // Take away the number of points the powerup costed
            } else {
                playSound(soundToPlay: .failure)
                print("Doesn't have enough points")
            }
            
        }
    }
}
