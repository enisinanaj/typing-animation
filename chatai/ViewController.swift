//
//  ViewController.swift
//  chatai
//
//  Created by Eni Sinanaj on 21/02/2017.
//  Copyright © 2017 Eni Sinanaj. All rights reserved.
//

import UIKit
import pop

class ViewController: UIViewController {
    // We will attach various animations to this in response to drag events
    var currentStartingYPoint: Double = 55
    var downObjects: Int = 0
    
    var circle: UIView!
    var circle1: UIView!
    var circle2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCircles()
        addTypingAnimation();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initCircles() {
        // Add a draggable view
        circle = UIView(frame: CGRect(x: 30.0, y: currentStartingYPoint, width: 10.0, height: 10.0))
        //circle.center = self.view.center
        circle.layer.cornerRadius = 5.0
        circle.backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        
        circle1 = UIView(frame: CGRect(x: 45.0, y: currentStartingYPoint, width: 10.0, height: 10.0))
        //circle.center = self.view.center
        circle1.layer.cornerRadius = 5.0
        circle1.backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        
        circle2 = UIView(frame: CGRect(x: 60.0, y: currentStartingYPoint, width: 10.0, height: 10.0))
        //circle.center = self.view.center
        circle2.layer.cornerRadius = 5.0
        circle2.backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        
        self.view.addSubview(circle)
        self.view.addSubview(circle1)
        self.view.addSubview(circle2)
    }
    
    func addTypingAnimation() {
//        animateDown(view: circle, delay: 0)
//        animateDown(view: circle1, delay: 0.2)
//        animateDown(view: circle2, delay: 0.4)
        animateAllUp()
    }
    
    func animateAllUp() {
        downObjects = 0
        animateUp(view: circle, delay: 0)
        animateUp(view: circle1, delay: 0.2)
        animateUp(view: circle2, delay: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateDown(view: UIView, delay: Double) {
        let newY = currentStartingYPoint + 15.0
        
        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        toNewYAnimation?.name = "newYAnimationDown"
        toNewYAnimation?.springSpeed = 3
        toNewYAnimation?.toValue = newY
        toNewYAnimation?.beginTime = CACurrentMediaTime() + delay
        toNewYAnimation?.springBounciness = 0
        toNewYAnimation?.animationDidReachToValueBlock = { (anim: POPAnimation?) -> Void in
            if anim?.name == "newYAnimationDown" {
                self.downObjects += 1
                
                if self.downObjects == 3 {
//                    anim?.pop_removeAnimation(forKey: "newYAnimationDown")
//                } else {
                    self.animateAllUp()
                }
            }
        }
//        toNewYAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
//            if anim?.name == "newYAnimationDown" {
//                self.animateUp(view: view)
//            }
//        }
        
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
                self.animateDown(view: view, delay: delay)
            }
        }
//        toNewYAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
//            if anim?.name == "newYAnimationTop" {
//                self.animateDown(view: view, delay: 0)
//            }
//        }
        
        view.layer.pop_add(toNewYAnimation, forKey: "newYAnimationTop")
    }

}

