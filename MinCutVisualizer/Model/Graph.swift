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
    
    internal init(vertices: [Vertex<T>], edges: [Edge<T>]) {
        self.vertices = vertices
        self.edges = edges
    }

    convenience init(verticeValues: [T], type: T.Type) {
        var vertices: [Vertex<T>] = []
        for (i, value) in verticeValues.enumerated() {
            let vertex = Vertex(value: value, index: i)
            vertices.append(vertex)
        }
        let edges = generateRandomUndirectedEdges(betweenVertices: vertices)

        self.init(vertices: vertices, edges: edges)
    }
    
    convenience init() {
        self.init(vertices: [], edges: [])
    }
    

}

//func setupColoredGraph<UIColor>(numVertices: Int) -> Graph<UIColor> {
//    let vertices = generateRandomNumVerticesWithColors(numVertices)
//    let edges = generateRandomUndirectedEdges(betweenVertices: vertices)
//    return Graph(vertices: vertices, edges: edges)
//}

