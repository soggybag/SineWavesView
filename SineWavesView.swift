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
    var timer: NSTimer!
    
    var centerY: Double!
    var steps = 200
    var stepX: Double!
    
    /** Add a new sinewave to be rendered by this view */
    func addSineWave(sineWave: SineWave) {
        array.append(sineWave)
        layer.addSublayer(sineWave.layer)
    }
    
    func setup() {
        centerY = Double(frame.height / 2)
        
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
    
    override func layoutSubviews() {
        stepX = Double(frame.width / CGFloat(steps))
    }
    
    override func drawRect(rect: CGRect) {
        update()
    }
    
    func onTimer(timer: NSTimer) {
        update()
    }
    
    func update() {
        // Draw a sine curve with a fill
        
        for sineWave in array {
            let path = UIBezierPath()
            
            path.moveToPoint(CGPoint(x: 0, y: frame.height))
            path.addLineToPoint(CGPoint(x: 0, y: centerY))
            
            sineWave.increment()
            
            let f = M_PI * 2 / Double(steps) * sineWave.frequency
            
            for i in 0 ..< steps {
                let x = Double(i) * stepX
                let y = (sin((Double(i) * f) + sineWave.phase) * sineWave.amplitude) + Double(centerY)
                path.addLineToPoint(CGPoint(x: x, y: Double(y)))
            }
            
            path.addLineToPoint(CGPoint(x: frame.width, y: frame.height))
            path.closePath()
            
            sineWave.layer.path = path.CGPath
            sineWave.layer.lineWidth = 0
            sineWave.layer.fillColor = sineWave.color.CGColor // sineWave.color.CGColor
        }
    }
    
    
}
