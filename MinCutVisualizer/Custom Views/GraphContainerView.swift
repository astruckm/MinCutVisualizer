//
//  GraphContainerView.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/22/21.
//

import UIKit

protocol DrawsGraph {
    var vertexViews: [(view: VertexView, color: UIColor)] { get set }
    func contract(edgeAtIndex edgeIndex: Int)
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
    var edgePaths: [UIBezierPath] = []
    
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
            edgePaths.append(path)
        }
    }
    
    private func applyStroke(_ path: UIBezierPath) {
        path.lineWidth = 1.5
        UIColor.lightGray.setStroke()
        path.stroke()
    }
    
    func contract(edgeAtIndex edgeIndex: Int) {
        let edge = edgeConnections[edgeIndex]
        let coords = edgePoints[edgeIndex]
        let translation: CGPoint = CGPoint(x: coords.end.x-coords.start.x, y: coords.end.y-coords.start.y)
        
        UIView.animate(withDuration: 0.5) {
            edge.start.transform = edge.start.transform.translatedBy(x: translation.x, y: translation.y)
            edge.start.layoutIfNeeded()
        } completion: { (finished) in
            if finished {
                edge.start.isHidden = true
            }
        }
        self.edgeConnections.remove(at: edgeIndex)
        self.setNeedsDisplay()
        
    }
    
    func drawEdges() {
        for (i, edge) in edgePoints.enumerated() {
            CATransaction.begin()
            let layer = CAShapeLayer()
            layer.strokeColor = UIColor.lightGray.cgColor
            layer.lineWidth = 1.5
            let path = UIBezierPath()
            layer.path = path.cgPath
            
            let animation = CABasicAnimation(keyPath: "strokeEnd \(i)")
            animation.fromValue = edge.start
            animation.toValue = edge.end
            animation.duration = 0.5
            
            CATransaction.setCompletionBlock{ [weak self] in
                print("Animation completed")
            }
            
            layer.add(animation, forKey: "stroke \(i)")

            CATransaction.commit()
            self.layer.addSublayer(layer)
            edgePaths.append(path)
        }
        
    }
    
    
}
