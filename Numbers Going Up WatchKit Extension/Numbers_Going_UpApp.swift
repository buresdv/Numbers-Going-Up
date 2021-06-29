//
//  Numbers_Going_UpApp.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

@main
struct Numbers_Going_UpApp: App {    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(currentScore: Score(), scoreMultiplier: ScoreMultiplier())
            }
        }
    }
}
