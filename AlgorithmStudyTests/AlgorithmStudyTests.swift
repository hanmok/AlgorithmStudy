//
//  AlgorithmStudyTests.swift
//  AlgorithmStudyTests
//
//  Created by Mac mini on 2023/04/13.
//

import XCTest
@testable import AlgorithmStudy

final class AlgorithmStudyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_twoCircles() {
        let twoCircles = TwoCircles()

//        XCTAssertEqual(twoCircles.getMinX(2, 1), 2)
//        XCTAssertEqual(twoCircles.getMaxX(3, 2), 2)
//        XCTAssertEqual(twoCircles.solution(2, 3), 20)
//        XCTAssertEqual(twoCircles.slowSolution(2, 4), twoCircles.solution(2, 4))
//        XCTAssertEqual(twoCircles.slowSolution(3, 5), twoCircles.solution(3, 5))
        
        XCTAssertEqual(twoCircles.slowSolution(3, 5), 56)
        XCTAssertEqual(twoCircles.solution(3, 5), 56)
        
//        XCTAssertEqual(twoCircles.slowSolution(3, 5), 48)
        XCTAssertEqual(twoCircles.slowSolution(100, 200), twoCircles.solution(100, 200))
//        XCTAssertEqual(twoCircles.slowSolution(300, 1000), twoCircles.solution(300, 1000))
    }
    
    func test_targetingSystem() {
        let targeting = TargetingSystem()
        let sol = targeting.solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]])
        XCTAssertEqual(sol, 3)
    }
}

// MARK: - SeeSaw
extension AlgorithmStudyTests {
    func test_couple() {
        let seeSaw = SeeSaw()
        XCTAssertEqual(seeSaw.areCouple(100, 100), true)
        XCTAssertEqual(seeSaw.areCouple(180, 100), false)
        XCTAssertEqual(seeSaw.areCouple(180, 270), true)
        XCTAssertEqual(seeSaw.areCouple(180, 270), true)
        
        XCTAssertEqual(seeSaw.solution([100, 180, 360, 100, 270]), 4)
    }
}


extension AlgorithmStudyTests {
    func test_Mining() {
        let mining = Mining()
        XCTAssertEqual(mining.solution([1, 3, 2], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]), 12)
        
        XCTAssertEqual(mining.solution([1, 0, 0], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]), 5)
//        XCTAssertEqual(mining.solution([1, 0, 0], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]), 12)
        
//        XCTAssertEqual(mining.getMaxFatigue(["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]), 116)
        XCTAssertEqual(mining.solution([0, 1, 1], ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"]), 50)
    }
}
