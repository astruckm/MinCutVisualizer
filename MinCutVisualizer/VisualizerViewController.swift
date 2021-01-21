//
//  VisualizerViewController.swift
//  MinCutVisualizer
//
//  Created by Andrew Struck-Marcell on 1/21/21.
//

import UIKit

class VisualizerViewController: UIViewController {
    @IBOutlet weak var newGraphButton: UIButton!
    

    @IBAction func generateNewGraph(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    
    private func setupUI() {
        newGraphButton.layer.cornerRadius = 10
    }

}

