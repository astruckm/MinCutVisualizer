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

func generateRandomEdges<T>(betweenVertices vertices: [Vertex<T>]) -> [Edge<T>] {
    //1. select random total number of edges between 1.5 * vertices.count and 2 * vertices.count
    //2. need to make each vertex be in at least 1 edge source and 1 edge destination (after that, can be totally random?
    
    return []
}

func generateRandomColors(_ numColors: Int) -> [UIColor] {
    return []
}


func generateRandomColor() -> UIColor {
    return .blue
}
