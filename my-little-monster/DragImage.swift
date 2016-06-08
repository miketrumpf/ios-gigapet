//
//  DragImage.swift
//  my-little-monster
//
//  Created by Mike on 6/8/16.
//  Copyright © 2016 Devshop. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        //calling the parent initializer.  need to initialize it to use all of its methods
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //first save off where the touch started
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //passes in a set of touches
        //grab first object out of set
        if let touch = touches.first {
            //grab the position of the touch within the superview(whole screen)
            let position = touch.locationInView(self.superview)
            //wherever your finger is dragging, move the object.
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //conditional && example
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview)
            //if it is on the character at all
            if CGRectContainsPoint(target.frame, position) {
                //creating a new notification inline. make notification so view controller knows what to do next
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        self.center = originalPosition
        
        
    }
    
    
    
}

