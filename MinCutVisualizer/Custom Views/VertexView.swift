//
//  VertexView.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import UIKit

class VertexView: UIView {
    // This is mostly for testing purposes
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = self.bounds.height / CGFloat(2)
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        label.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
