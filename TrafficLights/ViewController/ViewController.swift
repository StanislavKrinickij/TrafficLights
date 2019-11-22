//
//  ViewController.swift
//  TrafficLights
//
//  Created by Станислав Криницкий on 22.11.2019.
//  Copyright © 2019 Stanislav Krinickij. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    
    private let lightIsOn = 1
    private let lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 15
        
        redView.alpha = CGFloat(lightIsOff)
        yellowView.alpha = CGFloat(lightIsOff)
        greenView.alpha = CGFloat(lightIsOff)
    
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        switch currentLight {
        case .red:
            greenView.alpha = CGFloat(lightIsOff)
            redView.alpha = CGFloat(lightIsOn)
            currentLight = .yellow
        case .yellow:
            redView.alpha = CGFloat(lightIsOff)
            yellowView.alpha = CGFloat(lightIsOn)
            currentLight = .green
        case .green:
            yellowView.alpha = CGFloat(lightIsOff)
            greenView.alpha = CGFloat(lightIsOn)
            currentLight = .red
        }
    }
}

