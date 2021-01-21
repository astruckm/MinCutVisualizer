//
//  MinCutImplementation.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import Foundation


public func kargerMinCut(of graph: [[Int]]) -> (contracted: [Int], leftover: [Int]) {
    var contracted: [Int] = []
    var leftover: [Int] = []
    var randomVertexIdx = Int.random(in: 0..<graph.count)
    var currentVertex = graph[randomVertexIdx]

    var visitedVertices: Set<Int> = [] /// The indices of the verticies that are getting merged with each contraction
    while (visitedVertices.count + 1) < graph.count {
        //for each new random edge, merge the row/vertex in it with the row/vertex it points to by adding pointed-to row/vertex to contractionGraph.contracted
        contracted = contracted + currentVertex
        //add the contracted index to visitedVertices
        visitedVertices.insert(randomVertexIdx)
        //go through contractionGraph.contracted, check for values contained in visitedVertices, delete those self-loops
        var newContracted: [Int] = []
        for edgeRef in contracted {
            if !visitedVertices.contains(edgeRef) {
                newContracted.append(edgeRef)
            }
        }
        contracted = newContracted

        //get a new random edge within contractionGraph.contracted
        let randomEdgeIdx = Int.random(in: 0..<contracted.count)
        randomVertexIdx = contracted[randomEdgeIdx]
        currentVertex = graph[randomVertexIdx]
    }
    
    //Find unvistedVertex
    for (idx, vertex) in graph.enumerated() {
        if !visitedVertices.contains(idx) {
            leftover = vertex
            break
        }
    }
    
    return (contracted, leftover) /// Can check if it's actually the min cut using the count of contractionGraph.leftover array
}
