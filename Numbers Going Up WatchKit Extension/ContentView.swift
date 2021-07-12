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
    @State private var isCountdownRunning = false
    
    @State private var timerTimeRemaining = 5
    
    @ObservedObject var currentScore: Score
    @ObservedObject var scoreMultiplier: ScoreMultiplier
    @ObservedObject var buttonTappedAmount: ButtonTappedAmount
    
    var body: some View {        
        VStack {
            VStack {
                if isCountdownRunning == false {
                    Text("\(currentScore.score)")
                        .font(.title)
                        .minimumScaleFactor(0.5)
                } else {
                    HStack {
                        Text("\(currentScore.score)+")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                        Text("\(Int(scrollAmount))")
                            .focusable(true)
                            .digitalCrownRotation($scrollAmount, from: 0, through: Double(currentScore.score * 3), by: Double(buttonTappedAmount.tappedAmount), sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true)
                            .font(.title)
                    }
                }
                
                VStack { // Points per tap and scroll countdown text
                    if isCountdownRunning == false {
                        Text("\(scoreMultiplier.multiplierValue) per tap")
                            .foregroundColor(.accentColor)
                            .minimumScaleFactor(0.5)
                    } else {
                        var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Definovat zobrazení zbývajícího času
                        Text("\(timerTimeRemaining)")
                            .foregroundColor(Color.yellow)
                            .onReceive(timer) { time in
                                // Start counting down from 5
                                if self.timerTimeRemaining > 0 {
                                    self.timerTimeRemaining -= 1
                                }
                                // When the timer reaches 0, reset it back to 5 for the next activation of Magic Scroll
                                if self.timerTimeRemaining == 0 {
                                    currentScore.score += Int(scrollAmount)
                                    scrollAmount = 0
                                    isCountdownRunning = false
                                    self.timerTimeRemaining = 5
                                }
                            }
                    }
                }
                
                VStack { // Button stack
                    Button(action: {
                        currentScore.score += 1 * scoreMultiplier.multiplierValue // Increase score
                        buttonTappedAmount.tappedAmount += 1 // Increase the tapped amount for the purpose of playing effects
                        
                        checkScoreForEffects(currentScore: buttonTappedAmount.tappedAmount) // check if the current number of taps is supposed to play any effects
                        print(String(currentScore.score, radix: 16))
                    }, label: {
                        Text(LocalizedStringKey("go-up-button"))
                    })
                    
                    Button(action: {
                        self.isShowingSheet = true
                    }, label: {
                        Text(LocalizedStringKey("powerup-button"))
                    })
                    .sheet(isPresented: $isShowingSheet, content: {
                        // Send isShowingSheet in order for the sheet to go down when a powerup is bought
                        // Send currentScore in order to let the powerups know how many points the player has to see if they can buy a powerup
                        PowerupListView(isShowingSheet: $isShowingSheet, currentScore: $currentScore.score, scoreMultiplier: $scoreMultiplier.multiplierValue, isCountdownRunning: $isCountdownRunning)
                    })
                }
            }
            VStack {
                #warning("TODO: Zprovoznit. Když to tu je, celý view zmizí nad horní část viewportu")
                //Text("You tapped \(buttonTappedAmount.tappedAmount) times")
                //   .foregroundColor(.accentColor)
            }
        }
    }
}
