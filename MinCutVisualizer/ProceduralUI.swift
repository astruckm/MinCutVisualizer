//
//  ProceduralUI.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import UIKit



func generateUniqueRandomNumberOrder(inRange range: ClosedRange<Int>) -> [Int] {
    var rangeArray = Array(range)
    var randomNumbers: [Int] = []
    while rangeArray.count > 0 {
        let randomIdx = Int.random(in: 0..<rangeArray.count)
        rangeArray.swapAt(randomIdx, rangeArray.count-1)
        let randomNum = rangeArray.removeLast()
        randomNumbers.append(randomNum)
    }
    return randomNumbers
}

func generateRandomUndirectedEdges<T>(betweenVertices vertices: [Vertex<T>]) -> [Edge<T>] {
    guard vertices.count > 1 else { return [] }
    //1. select random total number of edges between 1.25 * vertices.count and 2 * vertices.count
    let possibleNumEdges = Int(Float(vertices.count) * 1.25)...(vertices.count * 2)
    let numEdges = Int.random(in: possibleNumEdges)
    // there will be 2 vertices for each edge
    let numVerticeAppearances = numEdges * 2
    //2. list of all vertex appearances
    //2a. start with 2 of each vertex, to minimize multiple edges and chances of self-loops
    var allVertexAppearances: [(vertex: Vertex<T>, num: Int)] = vertices.map { ($0, 2) }
    //2b. then 2 * (numEdges - vertices.count) are chosen randomly
    for _ in 0..<(numVerticeAppearances-(vertices.count*2)) {
        let randomIdx = Int.random(in: 0..<vertices.count)
        allVertexAppearances[randomIdx].num += 1
    }
    
    // loop till all indices are deleted from allVertexAppearances
    var randomEdges: [Edge<T>] = []
    var numDeletedIndices: Int = 0
    while allVertexAppearances.count > 2 {
        // random num in index range of available vertices, then another random num in range except for 1st index.
        let randomIdx = Int.random(in: 0..<(allVertexAppearances.count))
        var secondRandomIdx = Int.random(in: 0..<(allVertexAppearances.count-1))
        secondRandomIdx = secondRandomIdx >= randomIdx ? secondRandomIdx + 1 : secondRandomIdx
        
        // Init new Edge
        let firstIdxValue = allVertexAppearances[randomIdx]
        let secondIdxValue = allVertexAppearances[secondRandomIdx]
        let edge = Edge(source: firstIdxValue.vertex, destination: secondIdxValue.vertex)
        randomEdges.append(edge)
        //decrement count for each vertex, if count is 0 delete and add to deletedindices
        allVertexAppearances[randomIdx].num -= 1
        allVertexAppearances[secondRandomIdx].num -= 1
        if allVertexAppearances[randomIdx].num <= 0 {
            allVertexAppearances.swapAt(randomIdx, allVertexAppearances.count-1)
            allVertexAppearances.removeLast()
            numDeletedIndices += 1
        }
        guard allVertexAppearances.count-1 >= secondRandomIdx else { continue }
        if allVertexAppearances[secondRandomIdx].num <= 0 {
            allVertexAppearances.swapAt(secondRandomIdx, allVertexAppearances.count-1)
            allVertexAppearances.removeLast()
            numDeletedIndices += 1
        }
        
    }
    //TODO: add edges for any leftovers in allVertexAppearances
    if let first = allVertexAppearances.first, let last = allVertexAppearances.last {
        let edge = Edge(source: first.vertex, destination: last.vertex)
        randomEdges.append(edge)
    }

    return randomEdges
}

func generateRandomColors(_ numColors: Int) -> [UIColor] {
    return []
}


func generateRandomColor() -> UIColor {
    return .blue
}
