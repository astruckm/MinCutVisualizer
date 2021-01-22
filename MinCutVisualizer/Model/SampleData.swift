//
//  SampleData.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/22/21.
//

import UIKit


let vertex1 = Vertex(value: 1, id: UUID(), index: 0)
let vertex2 = Vertex(value: 2, id: UUID(), index: 1)
let vertex3 = Vertex(value: 3, id: UUID(), index: 2)
let vertex4 = Vertex(value: 7, id: UUID(), index: 3)
let vertex5 = Vertex(value: 13, id: UUID(), index: 4)
let vertex6 = Vertex(value: 5, id: UUID(), index: 5)
let vertex7 = Vertex(value: 12, id: UUID(), index: 6)
let vertex8 = Vertex(value: 22, id: UUID(), index: 7)

let sampleVertices = [vertex1, vertex2, vertex3, vertex4, vertex5, vertex6, vertex7, vertex8]

let sampleEdges = [
    Edge(source: vertex1, destination: vertex2),
    Edge(source: vertex2, destination: vertex3),
    Edge(source: vertex3, destination: vertex4),
    Edge(source: vertex4, destination: vertex5),
    Edge(source: vertex5, destination: vertex6),
    Edge(source: vertex6, destination: vertex7),
    Edge(source: vertex7, destination: vertex8)
]

let systemColors: [UIColor] = [.systemRed, .systemBlue, .systemPink, .systemTeal, .systemGreen, .systemOrange, .systemYellow, .systemPurple]
