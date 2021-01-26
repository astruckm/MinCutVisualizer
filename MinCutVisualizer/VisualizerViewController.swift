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
    
    var graph = Graph(verticeValues: Array(1...8), type: Int.self)
    var graphDelegate: DrawsGraph?
    var currentVertexIdx = 0
    
    @IBAction func startPressed(_ sender: UIButton) {
        graphDelegate?.contract(edgeAtIndex: 0)
        currentVertexIdx += 1
    }
    
    @IBAction func generateNewGraph(_ sender: UIButton) {
        graph = Graph(verticeValues: Array(1...8), type: Int.self)
        
        makeNewGraph(graph)
        graphContainerView.setNeedsDisplay()
        currentVertexIdx = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphDelegate = graphContainerView
        setupUI()
    }
    
    
    private func setupUI() {
        newGraphButton.layer.cornerRadius = 10
    }
    
    func makeNewGraph(_ graph: Graph<Int>) {
        graphContainerView.subviews.forEach { $0.removeFromSuperview() }
        graphContainerView.edgePaths = []
        
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
        for (i, vv) in vertexViewsByID {
            print("vv by ID: \(i), \(vv.label.text)")
        }
        graphContainerView.edgeConnections = []
        for edge in graph.edges {
            print("source: \(edge.source.index), dest: \(edge.destination.index)")
            if let sourceView = vertexViewsByID[edge.source.index], let destView = vertexViewsByID[edge.destination.index] {
                print("sourceView: \(sourceView.label.text), destView: \(destView.label.text)")
                graphContainerView.edgeConnections.append((sourceView, destView))
            }
        }
    }
    
}

