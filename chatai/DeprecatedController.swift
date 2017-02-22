//
//  DeprecatedController.swift
//  chatai
//
//  Created by Eni Sinanaj on 22/02/2017.
//  Copyright © 2017 Eni Sinanaj. All rights reserved.
//

import Foundation
import UIKit

class Deprecated {
    
    var circleAnimator: UIViewPropertyAnimator?
    var circle: UIView?
    var circleCenter: CGPoint!
    
    func runAnimation() {
        circleAnimator = UIViewPropertyAnimator(duration: 0.01, timingParameters: getSpringParameters())
        
        circleAnimator!.addAnimations({
            self.circle?.center.y = (self.circle?.center.y)! + 5
        })
        circleAnimator!.startAnimation()
        circleAnimator!.addCompletion({ _ in
            self.runAnimationBackwards()
        })
    }
    
    func runAnimationBackwards() {
        circleAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: getSpringParameters())
        
        circleAnimator!.addAnimations({
            self.circle?.center.y = (self.circle?.center.y)! - 5
        })
        circleAnimator!.startAnimation()
        circleAnimator!.addCompletion({ _ in
            self.runAnimation()
        })
    }
    
    func getSpringParameters() -> UISpringTimingParameters {
        let mass: CGFloat = 1 // weight of the object 2,5
        let stiffness: CGFloat = 20 //70.0 //elasticity
        let damping: CGFloat = 2*sqrt(mass*stiffness) // point where the system comes to rest in the shortest period of time
        let underDamping: CGFloat = damping * 0.5
        let initialVelocity: CGVector = CGVector(dx: 100, dy: 100)
        return UISpringTimingParameters(mass: mass, stiffness: stiffness, damping: underDamping, initialVelocity: initialVelocity)
    }
    
    
    func dragCircle(gesture: UIPanGestureRecognizer) {
//        let target = gesture.view!
        
//        switch gesture.state {
//        case .began:
//            if circleAnimator != nil && circleAnimator!.isRunning {
//                circleAnimator!.stopAnimation(false)
//            }
//            circleCenter = target.center
//        case .changed:
//            let translation = gesture.translation(in: self.view)
//            target.center = CGPoint(x: circleCenter!.x + translation.x, y: circleCenter!.y + translation.y)
//        case .ended:
//            let v = gesture.velocity(in: target)
//            // 500 is an arbitrary value that looked pretty good, you may want to base this on device resolution or view size.
//            // The y component of the velocity is usually ignored, but is used when animating the center of a view
//            let velocity = CGVector(dx: v.x / 500, dy: v.y / 500)
//            let springParameters = UISpringTimingParameters(mass: 2.5, stiffness: 70, damping: 55, initialVelocity: velocity)
//            circleAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: springParameters)
//            
//            circleAnimator!.addAnimations({
//                target.center = self.view.center
//            })
//            circleAnimator!.startAnimation()
//        default: break
//        }
    }
    
    func animateUp() {
        //        let spring = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        //        spring?.toValue = 15
        //        spring?.springBounciness = 13 // a float between 0 and 20
        //        spring?.springSpeed = 8
        //        spring?.completionBlock = { (animation, finished) in
        //            if (animation?.name == "moveUp") {
        //                if (finished) {
        //                    self.animateDown();
        //                }
        //            }
        //        }
        //
        //        self.circle?.pop_add(spring, forKey: "moveUp")
        
//        let newY = currentStartingYPoint
//        
//        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
//        toNewYAnimation?.name = "newYAnimationTop"
//        toNewYAnimation?.springSpeed = 3
//        toNewYAnimation?.toValue = newY
        //        toNewYAnimation?.completionBlock = { (anim: POPAnimation?, done: Bool) -> Void in
        //            let cornerToNormal = POPSpringAnimation(propertyNamed: kPOPLayerCornerRadius)
        //            cornerToNormal?.toValue = NSValue(cgPoint: CGPoint(x: 1.0, y: 1.0))
        //            cornerToNormal?.springSpeed = 3
        //            self.plateView.layer.pop_add(cornerToNormal, forKey: "restoreCornerRadius")
        //        }
//        toNewYAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
//            if anim?.name == "newYAnimationTop" {
//                self.animateDown()
//            }
//        }
        
//        self.circle?.layer.pop_add(toNewYAnimation, forKey: "newYAnimationTop")
    }

}
