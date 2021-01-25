//
//  MinCutVisualizerTests.swift
//  MinCutVisualizerTests
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import XCTest
@testable import MinCutVisualizer

class MinCutVisualizerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGenerateRandomEdges() {
        let randomEdges1 = generateRandomUndirectedEdges(betweenVertices: sampleVertices)
        print(randomEdges1)
        
        
        XCTAssert(randomEdges1.count >= (sampleVertices.count * 5 / 4) && randomEdges1.count <= sampleVertices.count * 2)
    }

}
