//
//  checkIfPlayerHasEnoughPoints.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 01.07.2021.
//

import Foundation

func checkIfPlayerHasEnoughPoints(has: Int, needs: Int) -> Bool {
    if has >= needs {
        return true
    } else {
        return false
    }
}
