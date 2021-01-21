//
//  Graph.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import Foundation


public struct Vertex<T: Equatable> {
    let value: T
    let edges: [Edge<T>]
}

public struct Edge<T: Equatable> {
    let source: Vertex<T>
    let destination: Vertex<T>
}
