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
    
    var body: some View {
        VStack {
            Text("\(currentScore.score)")
                .font(.title)
            Text("SA: \(Int(scrollAmount))")
                .focusable(true)
                .digitalCrownRotation($scrollAmount, from: 0, through: Double(currentScore.score * 3), by: 1, sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true)
            Button(action: {
                currentScore.score += 1 * scoreMultiplier.multiplierValue
                print(String(currentScore.score, radix: 16))
            }, label: {
                Text("Go Up!")
            })
            
            Spacer()
            
            Button(action: {
                self.isShowingSheet = true
            }, label: {
                Text("Power-Ups")
            })
            .sheet(isPresented: $isShowingSheet, content: {
                PowerupListView()
            })
        }
    }
}
