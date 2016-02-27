//
//  SineWave.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/23/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class SineWavesView: UIView {
    
    var array = [SineWave]()
    
    var t: Double = 0
    var step: CGFloat = 0.15
    var range: CGFloat = 100
    var phase: CGFloat = 0
    var timer: NSTimer!
    var color: UIColor = UIColor.redColor()
    
    var pathLayer = CAShapeLayer()
    
    
    
    
    func addSineWave(sineWave: SineWave) {
        array.append(sineWave)
        layer.addSublayer(sineWave.layer)
    }
    
    
    
    
    
    func setup() {
        layer.addSublayer(pathLayer)
        NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "onTimer:", userInfo: nil, repeats: true)
    }
    

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func drawRect(rect: CGRect) {
        update()
    }
    
    func onTimer(timer: NSTimer) {
        t += Double(step)
        update()
    }
    
    func update() {
        // Draw a sine curve with a fill
        
        let centerY = frame.height / 2              // find the vertical center
        let steps = 200                             // Divide the curve into steps
        let stepX = frame.width / CGFloat(steps)    // find the horizontal step distance
        
        
        for sineWave in array {
            let path = UIBezierPath()
            
            path.moveToPoint(CGPoint(x: 0, y: frame.height))
            path.addLineToPoint(CGPoint(x: 0, y: centerY))
            
            sineWave.increment()
            
            let f = M_PI * 2 / Double(steps) * sineWave.frequency
            
            for i in 0...steps {
                let x = CGFloat(i) * stepX
                let y = (sin((Double(i) * f) + sineWave.phase) * sineWave.amplitude) + Double(centerY)
                path.addLineToPoint(CGPoint(x: x, y: CGFloat(y)))
            }
            
            path.addLineToPoint(CGPoint(x: frame.width, y: frame.height))
            path.closePath()
            
            sineWave.layer.path = path.CGPath
            sineWave.layer.lineWidth = 0
            sineWave.layer.fillColor = UIColor(white: 0, alpha: 0.5).CGColor // sineWave.color.CGColor
        }
    }
    
    
}
