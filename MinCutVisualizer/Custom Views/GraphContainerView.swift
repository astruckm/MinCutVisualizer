//
//  GraphContainerView.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/22/21.
//

import UIKit

protocol DrawsGraph {
    var vertexViews: [(view: VertexView, color: UIColor)] { get set }
    func contract(_ vertexView: VertexView)
}

class GraphContainerView: UIView, DrawsGraph {
    private var currentPath: UIBezierPath? = nil
    let vertexSide: CGFloat = 64
    var vertexViews: [(view: VertexView, color: UIColor)] = []
    var edgeConnections: [(start: VertexView, end: VertexView)] = []
    var edgePoints: [(start: CGPoint, end: CGPoint)] {
        return edgeConnections.map { (vertexViewPair) -> (start: CGPoint, end: CGPoint) in
            let startCenterX = (vertexViewPair.start.frame.maxX - vertexViewPair.start.frame.minX) / 2 + vertexViewPair.start.frame.minX
            let startCenterY = (vertexViewPair.start.frame.maxY - vertexViewPair.start.frame.minY) / 2 + vertexViewPair.start.frame.minY
            let endCenterX = (vertexViewPair.end.frame.maxX - vertexViewPair.end.frame.minX) / 2 + vertexViewPair.end.frame.minX
            let endCenterY = (vertexViewPair.end.frame.maxY - vertexViewPair.end.frame.minY) / 2 + vertexViewPair.end.frame.minY

            return (start: CGPoint(x: startCenterX, y: startCenterY), end: CGPoint(x: endCenterX, y: endCenterY))
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        for edge in edgePoints {
            currentPath = nil
            let path = UIBezierPath()
            path.move(to: edge.start)
            path.addLine(to: edge.end)
            path.close()
            
            applyStroke(path)
            currentPath = path
        }
    }
    
    private func applyStroke(_ path: UIBezierPath) {
        path.lineWidth = 3
        UIColor.darkGray.setStroke()
        path.stroke()
    }
    
    func contract(_ vertexView: VertexView) {
        UIView.animate(withDuration: 1) {
            vertexView.transform = CGAffineTransform(translationX: 50, y: 50)
        }
    }

    
}
