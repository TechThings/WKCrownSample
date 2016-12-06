//
//  InterfaceController.swift
//  WKCrownSample WatchKit Extension
//
//  Created by katsuya on 2016/12/07.
//  Copyright © 2016年 CrossBridge. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var rotationalDeltaLabel: WKInterfaceLabel!
    @IBOutlet var rotationsPerSecondLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        super.willActivate()
        
        crownSequencer.delegate = self
        crownSequencer.focus()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController: WKCrownDelegate {
    public func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        print("Delta:\(rotationalDelta)")
        if let crownSequencer = crownSequencer {
            print("PerSecond:\(crownSequencer.rotationsPerSecond)")
        }
        
        rotationalDeltaLabel.setText("Delta:\(rotationalDelta)")
        if let crownSequencer = crownSequencer {
            rotationsPerSecondLabel.setText("PerSecond:\(crownSequencer.rotationsPerSecond)")
        }
    }
}
