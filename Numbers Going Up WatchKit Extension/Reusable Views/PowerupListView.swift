//
//  PowerupListView.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

/*let powerups: [String: String] = [
    "Half to Double": "+ between half of current score and current score",
    "Magic Scroll": "Some text"
]*/

let allPowerUps = [
    // Define all available powerups
    PowerUp(name: "Half to Double", description: "This is the first desc"),
    PowerUp(name: "Magic Scroll", description: "This is the second desc"),
    PowerUp(name: "Double or Nothing", description: "Get double or lose everything")
]

struct PowerupListView: View {
    var body: some View {
        List {
            ForEach(allPowerUps) { powerUp in
                PowerupItem(powerUp: powerUp)
            }
        }
    }
}

struct PowerupListView_Previews: PreviewProvider {
    static var previews: some View {
        PowerupListView()
    }
}
