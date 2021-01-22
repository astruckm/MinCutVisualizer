//
//  GraphContainerView.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/22/21.
//

import UIKit

protocol DrawsGraph {
    var vertexViews: [(view: VertexView, coordinate: CGPoint, color: UIColor)] { get set }
}

class GraphContainerView: UIView, DrawsGraph {
    let vertexSide: CGFloat = 64
    var vertexViews: [(view: VertexView, coordinate: CGPoint, color: UIColor)] = []
    var edgeViews: [UIView] = []
    
    
    override func draw(_ rect: CGRect) {
        print("draw invoked")
        //TODO: draw edges here
    }
    
}
