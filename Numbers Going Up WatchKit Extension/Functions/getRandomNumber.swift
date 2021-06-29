//
//  getRandomNumber.swift
//  Numbers Going Up WatchKit Extension
//
//  Created by David Bureš on 29.06.2021.
//

import Foundation

func getRandomNumber(from: Int64, to: Int64) -> Int64 {
    return Int64.random(in: from...to)
}
