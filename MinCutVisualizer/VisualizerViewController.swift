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
    
    var graph = Graph(numVertices: 8, type: Int.self)
    var graphDelegate: DrawsGraph?

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
        
        
        for vertex in graph.vertices {
            let xRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.width-8)))
            let yRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.height-8)))
            let randomColor: UIColor = systemColors[Int.random(in: 0..<systemColors.count)]
            
            let vertexView = VertexView(frame: CGRect(x: xRandom, y: yRandom, width: graphContainerView.vertexSide, height: graphContainerView.vertexSide))
            graphContainerView.addSubview(vertexView)
            vertexView.label.text = String(vertex.value)
            vertexView.backgroundColor = randomColor
            graphContainerView.vertexViews.append((view: vertexView, coordinate: CGPoint(x: xRandom, y: yRandom), color: randomColor))
        }
        for edge in graph.edges {
            
        }
    }

}

