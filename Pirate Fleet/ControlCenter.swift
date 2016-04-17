//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine:_Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: true)
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x: 7, y: 2), isVertical: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 3, y: 7), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 2, y: 2), explosionText: "Blam-o")
        let mine2 = Mine(location: GridLocation(x: 2, y: 7), explosionText: "K-Boom")
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        print("The value of the final score is \(finalScore)")
        
        return finalScore
    }
}