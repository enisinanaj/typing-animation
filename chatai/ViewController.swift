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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTypingAnimation();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addTypingAnimation() {
        // Add a draggable view
        let circle = UIView(frame: CGRect(x: 30.0, y: currentStartingYPoint, width: 10.0, height: 10.0))
        //circle.center = self.view.center
        circle.layer.cornerRadius = 5.0
        circle.backgroundColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        
        animateDown(view: circle)
        
        self.view.addSubview(circle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateDown(view: UIView) {
        let newY = currentStartingYPoint + 15.0
        
        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        toNewYAnimation?.name = "newYAnimationDown"
        toNewYAnimation?.springSpeed = 3
        toNewYAnimation?.toValue = newY
        toNewYAnimation?.springBounciness = 17
        toNewYAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
            if anim?.name == "newYAnimationDown" {
                self.animateUp(view: view)
            }
        }
        
        view.layer.pop_add(toNewYAnimation, forKey: "newYAnimationDown")
    }
    
    func animateUp(view: UIView) {
        let newY = currentStartingYPoint
        
        let toNewYAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        toNewYAnimation?.name = "newYAnimationTop"
        toNewYAnimation?.springSpeed = 3
        toNewYAnimation?.toValue = newY
        toNewYAnimation?.completionBlock = {(anim: POPAnimation?, finished: Bool) -> Void in
            if anim?.name == "newYAnimationTop" {
                self.animateDown(view: view)
            }
        }
        
        view.layer.pop_add(toNewYAnimation, forKey: "newYAnimationTop")
    }

}

