//
//  AnimatinButton.swift
//  UIProject
//
//  Created by Carlos Reda on 1/1/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit


class AnimatinButton: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    @IBAction func PulseBtn(_ sender: UIButton) {
     sender.pulsate()
        
    }
    
    @IBAction func FlashBtn(_ sender: UIButton) {
        sender.flash()
    }
    @IBAction func ShakeBtn(_ sender: UIButton) {
        sender.shake()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
