//
//  PowerupItem.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

struct PowerupItem: View {
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
        .onTapGesture {
            // Define what happens on tap of a powerup
            chooseRightEffect(effectKey: powerUp.effect) // Calls applyEffect
            playSound(soundToPlay: .success)
        }
    }
}
