//
//  Powerup.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import Foundation

struct PowerUp: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let cost: Int
    let effect: String
}
