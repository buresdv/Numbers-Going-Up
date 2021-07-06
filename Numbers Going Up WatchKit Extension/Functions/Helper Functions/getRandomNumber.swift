//
//  getRandomNumber.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import Foundation

func getRandomNumber(from: Int, to: Int) -> Int {
    return Int.random(in: from...to)
}
