//
//  Graph.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import Foundation


public struct Vertex<T: Equatable>: Identifiable {
    public let value: T
    public let id: UUID
}

public struct Edge<T: Equatable> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
}


class Graph<T: Equatable> {
    var vertices: [Vertex<T>]
    var edges: [Edge<T>]
    
    internal init(vertices: [Vertex<T>], edges: [Edge<T>]) {
        self.vertices = vertices
        self.edges = edges
    }

    convenience init(numVertices: Int, type: T.Type) {
        //TODO: generate random vertices and edges
        
        self.init(vertices: [], edges: [])
    }
    
    convenience init() {
        self.init(vertices: [], edges: [])
    }

}


