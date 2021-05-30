//
//  Game.swift
//  Bullseye
//
//  Created by Владислав Котик on 29/05/2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        if difference == 0 {
            return 200
        }
        else if difference == 1 {
            return 150
        }
        return 100 - difference
    }
    mutating func startNewRound(points: Int) {
        self.score += points
        self.round += 1
        self.target = Int.random(in: 1...100)
    }
    mutating func restart() {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
    }
}
