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
    
    var graph: Graph<UIColor> = Graph()
    var graphDelegate: DrawsGraph?
    var currentVertexIdx = 0
    let possibleNumOfVertices = 4...6
    
    @IBAction func startPressed(_ sender: UIButton) {
        guard (currentVertexIdx) < graph.vertices.count else { return }
        graphDelegate?.contract(edgeAtIndex: 0)
        currentVertexIdx += 1
    }
    
    @IBAction func generateNewGraph(_ sender: UIButton) {
        graph = Graph()
        let numVertices = Int.random(in: possibleNumOfVertices)
        graph.vertices = self.generateRandomNumVerticesWithColors(numVertices)
        graph.edges = self.generateRandomUndirectedEdges(betweenVertices: graph.vertices)
        
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
    
    func makeNewGraph(_ graph: Graph<UIColor>) {
        graphContainerView.subviews.forEach { $0.removeFromSuperview() }
        graphContainerView.edgePaths = []
        
        var vertexViewsByID: [Int: VertexView] = [:]
        for vertex in graph.vertices {
            let xRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.width-8)))
            let yRandom = CGFloat(Int.random(in: 8...Int(graphContainerView.bounds.height-8)))
            
            let vertexView = VertexView(frame: CGRect(x: xRandom, y: yRandom, width: graphContainerView.vertexSide, height: graphContainerView.vertexSide))
            graphContainerView.addSubview(vertexView)
            vertexView.label.text = String(vertex.index)
            vertexView.backgroundColor = vertex.value
            graphContainerView.vertexViews.append((view: vertexView, color: vertex.value))
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

extension VisualizerViewController: RandomGraphElements { }

