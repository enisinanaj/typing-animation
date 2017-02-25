//
//  TypingLoaderAnimation.swift
//  chatai
//
//  Created by Eni Sinanaj on 25/02/2017.
//  Copyright © 2017 Eni Sinanaj. All rights reserved.
//

import Foundation
import pop

class TypingLoaderAnimation {
    var currentStartingYPoint: Double!
    var downObjects: Int = 0
    var jump: Double = 7.0
    var viewList: Array<UIView> = Array<UIView>()
    
    init(viewList: Array<UIView>, resetZeroTo: Double) {
        self.currentStartingYPoint = resetZeroTo
        self.viewList = viewList
    }
    
    func addViewToAnimation(view: UIView) {
        viewList.append(view)
    }
    
    func startAnimation() {
        downObjects = 0
        var delay: Double = 0;
        
        for view in viewList {
            animateUp(view: view, delay: delay)
            delay = delay + 0.2
        }
    }
    
    func animateDown(view: UIView, delay: Double) {
        let newY = currentStartingYPoint + jump
        
        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        toNewYAnimation?.name = "newYAnimationDown"
        toNewYAnimation?.springSpeed = 3
        toNewYAnimation?.toValue = newY
        toNewYAnimation?.beginTime = CACurrentMediaTime() + delay
        toNewYAnimation?.springBounciness = 0
        toNewYAnimation?.animationDidReachToValueBlock = { (anim: POPAnimation?) -> Void in
            if anim?.name == "newYAnimationDown" {
                self.downObjects += 1
                
                if self.downObjects == self.viewList.count {
                    self.startAnimation()
                }
            }
        }
        
        view.layer.pop_add(toNewYAnimation, forKey: "newYAnimationDown")
    }
    
    func animateUp(view: UIView, delay: Double) {
        let newY = currentStartingYPoint
        
        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        toNewYAnimation?.name = "newYAnimationTop"
        toNewYAnimation?.springSpeed = 3
        toNewYAnimation?.toValue = newY
        toNewYAnimation?.beginTime = CACurrentMediaTime() + delay
        toNewYAnimation?.animationDidReachToValueBlock = { (anim: POPAnimation?) -> Void in
            if anim?.name == "newYAnimationTop" {
                self.animateDown(view: view, delay: 0)
            }
        }
        
        view.layer.pop_add(toNewYAnimation, forKey: "newYAnimationTop")
    }
}
