//
//  SampleData.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/22/21.
//

import UIKit


let vertex1 = Vertex(value: 1, id: UUID())
let vertex2 = Vertex(value: 2, id: UUID())
let vertex3 = Vertex(value: 3, id: UUID())
let vertex4 = Vertex(value: 7, id: UUID())
let vertex5 = Vertex(value: 13, id: UUID())
let vertex6 = Vertex(value: 5, id: UUID())
let vertex7 = Vertex(value: 12, id: UUID())
let vertex8 = Vertex(value: 22, id: UUID())

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
