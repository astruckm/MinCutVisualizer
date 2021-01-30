//
//  Graph.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import UIKit


public struct Vertex<T: Equatable> {
    public let value: T
    public let index: Int
}

extension Vertex: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
}



public struct Edge<T: Equatable> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
}


class Graph<T: Equatable> {
    var vertices: [Vertex<T>]
    var edges: [Edge<T>]
    
    private init(vertices: [Vertex<T>], edges: [Edge<T>]) {
        self.vertices = vertices
        self.edges = edges
    }
    
    convenience init() {
        self.init(vertices: [], edges: [])
    }
    

}

