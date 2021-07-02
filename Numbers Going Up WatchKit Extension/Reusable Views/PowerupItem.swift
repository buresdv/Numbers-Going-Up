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
                switch powerUp.effect {
                case "halfToDouble":
                    print("Half to Double selected")
                    
                case "multiplier":
                    print("Multiplier selected")
                    
                case "doubleOrNothing":
                    // 50/50 change to get double or lose everything
                    if getRandomNumber(from: 1, to: 2) == 1 {
                        print("Got double")
                        currentScore = currentScore + currentScore + powerUp.cost // powerUp.cost
                        print("New score: \(currentScore)")
                    } else {
                        currentScore = currentScore - currentScore + powerUp.cost
                        print("Lost everything")
                    }
                    
                default:
                    print("Nothing selected")
                }
                
                
                playSound(soundToPlay: .success)
                
                currentScore = currentScore - powerUp.cost // Take away the number of points the powerup costed
            } else {
                playSound(soundToPlay: .failure)
                print("Doesn't have enough points")
            }
            
        }
    }
}
