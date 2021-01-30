//
//  MinCutVisualizerTests.swift
//  MinCutVisualizerTests
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import XCTest
@testable import MinCutVisualizer

class MinCutVisualizerTests: XCTestCase {
    struct RandomGraphGeneration: RandomGraphElements { }
    var graphGeneration: RandomGraphGeneration!

    override func setUpWithError() throws {
        graphGeneration = RandomGraphGeneration()
    }

    override func tearDownWithError() throws {
        graphGeneration = nil
    }
    
    func testGenerateRandomColorVertices() {
        let numVertices = 10
        let randomVertices = graphGeneration.generateRandomNumVerticesWithColors(numVertices)
        XCTAssert(randomVertices.count == numVertices)
        
        var verticesSet: Set<Vertex<UIColor>> = []
        for (i, vertex) in randomVertices.enumerated() {
            XCTAssert(i == vertex.index)
            verticesSet.insert(vertex)
        }
        XCTAssert(randomVertices.count == verticesSet.count)
    }

    func testGenerateRandomEdges() {
        let randomEdges1 = graphGeneration.generateRandomUndirectedEdges(betweenVertices: sampleVertices)
        for edge in randomEdges1 {
            print("\(edge.destination.index)-----\(edge.source.index)")
        }
        
        XCTAssert(randomEdges1.count >= (sampleVertices.count * 5 / 4) && randomEdges1.count <= sampleVertices.count * 2)
    }

}
