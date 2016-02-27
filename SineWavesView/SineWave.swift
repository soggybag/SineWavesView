//
//  SineWave.swift
//  SineWavesView
//
//  Created by mitchell hudson on 2/27/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

class SineWave {
    var amplitude: Double!
    var frequency: Double!
    var rate: Double!
    var phase: Double!
    var color: UIColor!
    
    var layer = CAShapeLayer()
    
    func increment() {
        phase = phase + rate
    }
    
    init(amplitude: Double, frequency: Double, rate: Double, color: UIColor) {
        self.amplitude = amplitude
        self.frequency = frequency
        self.rate = rate
        self.phase = 0
        self.color = color
    }
}