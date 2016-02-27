//
//  ViewController.swift
//  SineWavesView
//
//  Created by mitchell hudson on 2/27/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sineWaveView: SineWavesView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sineWave1 = SineWave(amplitude: 20, frequency: 1.8, rate: 0.011, color: UIColor(white: 0, alpha: 0.5))
        let sineWave2 = SineWave(amplitude: 18, frequency: 1.34, rate: 0.023, color: UIColor(white: 0, alpha: 0.5))
        let sineWave3 = SineWave(amplitude: 12, frequency: 1, rate: 0.031, color: UIColor(white: 0, alpha: 0.5))
        
        sineWaveView.addSineWave(sineWave1)
        sineWaveView.addSineWave(sineWave2)
        sineWaveView.addSineWave(sineWave3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

