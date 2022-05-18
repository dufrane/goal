//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by d vasylenko on 05.02.2022.
//

import XCTest
@testable import Bullseye

var game: Game!


class BullseyeTests: XCTestCase {

    override func setUpWithError() throws {
        game = Game ()
    }

    override func tearDownWithError() throws {
       game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
}
