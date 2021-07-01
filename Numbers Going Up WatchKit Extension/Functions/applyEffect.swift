//
//  applyEffect.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 01.07.2021.
//

import Foundation
import SwiftUI

func chooseRightEffect(effectKey: String) -> Void {
    switch effectKey {
    case "halfToDouble":
        halfToDouble()
    case "multiplier":
        multiplier()
    case "doubleOrNothing":
        doubleOrNothing()
    default:
        print("Nothing selected")
    }
}

func halfToDouble() -> Void {
    print("Half to Double selected")
}

func multiplier() -> Void {
    print("Multiplier selected")
}

func doubleOrNothing() -> Void {
    // 50/50 change to get double or lose everything
    if getRandomNumber(from: 1, to: 2) == 1 {
        print("Got double")
    } else {
        print("Lost everything")
    }
}
