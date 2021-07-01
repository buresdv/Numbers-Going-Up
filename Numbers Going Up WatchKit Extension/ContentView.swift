//
//  ContentView.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    @State var scrollAmount = 0.0
    
    @ObservedObject var currentScore: Score
    @ObservedObject var scoreMultiplier: ScoreMultiplier
    @ObservedObject var buttonTappedAmount: ButtonTappedAmount
    
    var body: some View {
        VStack {
            Text("\(currentScore.score)")
                .font(.title)
            
            /*Text("SA: \(Int(scrollAmount))")
                .focusable(true)
                .digitalCrownRotation($scrollAmount, from: 0, through: Double(currentScore.score * 3), by: Double(buttonTappedAmount.tappedAmount), sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true)*/
            
            Text("\(scoreMultiplier.multiplierValue) per tap")
                .foregroundColor(.accentColor)
            Button(action: {
                currentScore.score += 1 * scoreMultiplier.multiplierValue // Increase score
                buttonTappedAmount.tappedAmount += 1 // Increase the tapped amount for the purpose of playing effects
                
                checkScoreForEffects(currentScore: buttonTappedAmount.tappedAmount) // check if the current number of taps is supposed to play any effects
                print(String(currentScore.score, radix: 16))
            }, label: {
                Text(LocalizedStringKey("go-up-button"))
            })
            
            Spacer()
            
            Button(action: {
                self.isShowingSheet = true
            }, label: {
                Text(LocalizedStringKey("powerup-button"))
            })
            .sheet(isPresented: $isShowingSheet, content: {
                #warning("TODO: Tenhle sheet by měl zmizet když kliknou na powerup v powerupListView")
                
                // Send isShowingSheet in order for the sheet to go down when a powerup is bought
                // Send currentScore in order to let the powerups know how many points the player has to see if they can buy a powerup
                PowerupListView(isShowingSheet: $isShowingSheet, currentScore: $currentScore.score)
            })
        }
    }
}
