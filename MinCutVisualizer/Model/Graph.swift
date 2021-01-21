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


class Graph<T: Equatable> {
    let vertices: [Vertex<T>]
    
    internal init(vertices: [Vertex<T>]) {
        self.vertices = vertices
    }

    convenience init(numVertices: Int, type: T.Type) {
        //TODO: generate random vertices and edges
        
        self.init(vertices: [])
    }
    
    convenience init() {
        self.init(vertices: [])
    }

}


