//
//  Game.swift
//  Bullseye
//
//  Created by Владислав Котик on 29/05/2021.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 150, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 75, date: Date()))
            leaderboardEntries.sort { $0.score > $1.score }
        }
    }
    
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
        self.addToLeaderboard(score: points)
    }
    mutating func restart() {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
    }
    mutating func addToLeaderboard(score: Int) {
        self.leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        self.leaderboardEntries.sort { $0.score > $1.score }
    }
}
