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
    
    func testGenerateRandomColorVertices() {
        let randomVertices = generateRandomNumVerticesWithColors(10)
        
        var verticesSet: Set<Vertex<UIColor>> = []
        for (i, vertex) in randomVertices.enumerated() {
            XCTAssert(i == vertex.index)
            verticesSet.insert(vertex)
        }
        XCTAssert(randomVertices.count == verticesSet.count)
    }

    func testGenerateRandomEdges() {
        let randomEdges1 = generateRandomUndirectedEdges(betweenVertices: sampleVertices)
        for edge in randomEdges1 {
            print("\(edge.destination.index)-----\(edge.source.index)")
        }
        
        XCTAssert(randomEdges1.count >= (sampleVertices.count * 5 / 4) && randomEdges1.count <= sampleVertices.count * 2)
    }

}
