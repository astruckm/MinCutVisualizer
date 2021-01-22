//
//  VisualizerViewController.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import UIKit

class VisualizerViewController: UIViewController {
    @IBOutlet weak var graphContainerView: GraphContainerView!
    @IBOutlet weak var newGraphButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var graph = Graph(numVertices: 8, type: Int.self)
    var graphDelegate: DrawsGraph?

    
    @IBAction func startPressed(_ sender: UIButton) {
        if let vv = graphContainerView.vertexViews.first?.view {
            graphDelegate?.contract(vv)
        }
    }
    
    @IBAction func generateNewGraph(_ sender: UIButton) {
        graph = Graph(numVertices: 8, type: Int.self)
        graph.vertices = sampleVertices
        graph.edges = sampleEdges
        
        updateGraphContainer(with: graph)
        graphContainerView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphDelegate = graphContainerView
        setupUI()
    }

    
    private func setupUI() {
        newGraphButton.layer.cornerRadius = 10
    }
    
    func updateGraphContainer(with graph: Graph<Int>) {
        graphContainerView.subviews.forEach { $0.removeFromSuperview() }
        
        var vertexViewsByID: [Int: VertexView] = [:]
        for vertex in graph.vertices {
            let xRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.width-8)))
            let yRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.height-8)))
            let randomColor: UIColor = systemColors[Int.random(in: 0..<systemColors.count)]
            
            let vertexView = VertexView(frame: CGRect(x: xRandom, y: yRandom, width: graphContainerView.vertexSide, height: graphContainerView.vertexSide))
            graphContainerView.addSubview(vertexView)
            vertexView.label.text = String(vertex.value)
            vertexView.backgroundColor = randomColor
            graphContainerView.vertexViews.append((view: vertexView, color: randomColor))
            graphContainerView.bringSubviewToFront(vertexView)
            
            vertexViewsByID[vertex.index] = vertexView
        }
        graphContainerView.edgeConnections = []
        for edge in graph.edges {
            if let sourceView = vertexViewsByID[edge.source.index], let destView = vertexViewsByID[edge.destination.index] {
                graphContainerView.edgeConnections.append((sourceView, destView))
            }
        }
    }

}

