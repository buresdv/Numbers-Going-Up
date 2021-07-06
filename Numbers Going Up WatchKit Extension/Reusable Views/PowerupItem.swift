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
    @Binding var scoreMultiplier: Int
    
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
            #warning("TODO: Jestli mají dost bodů zabarvit polčko zeleně, jestli ne, zabarvit červeně")
            print("Current score: \(currentScore)")
            print("Curent multiplier when tapping on powerup: \(scoreMultiplier)")
            if checkIfPlayerHasEnoughPoints(has: currentScore, needs: powerUp.cost) {
                // Close the powerups menu
                isShowingSheet = false
                
                // Define what happens on tap of a powerup
                switch powerUp.effect {
                case "halfToDouble":
                    // Calculate a number between quarter of current score and half of current score
                    let resultedRandomScore: Int = getRandomNumber(from: currentScore / 4, to: currentScore / 2)
                    // Apply the calculated number, then add the cost of the powerup
                    currentScore = currentScore + resultedRandomScore + powerUp.cost
                    
                case "multiplier":
                    scoreMultiplier = scoreMultiplier + 1
                    
                case "doubleOrNothing":
                    // 50/50 change to get double or lose everything
                    if getRandomNumber(from: 1, to: 2) == 1 {
                        print("Got double")
                        currentScore = currentScore + currentScore + powerUp.cost // powerUp.cost tam musí být, protože ten powerup stojí 300, tak by po úsěchu/neúspěchu hráč měl o 300 bodů míň
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
