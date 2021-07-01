//
//  playSound.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 01.07.2021.
//

import Foundation
import WatchKit

func playSound(soundToPlay: WKHapticType) -> Void {
    WKInterfaceDevice.current().play(soundToPlay)
}
