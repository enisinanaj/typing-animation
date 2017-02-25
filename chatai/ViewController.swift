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
    
    var circle: UIView!
    var circle1: UIView!
    var circle2: UIView!
    var circleLarge: UIView!
    var circle1Large: UIView!
    var circle2Large: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCircles()
        prepareAnimation()
        
        initLargeCircles()
        prepareAnimationLarge()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCircles() {
        let green = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        
        circle = UIView(frame: CGRect(x: 30.0, y: currentStartingYPoint, width: 5.0, height: 5.0))
        circle.layer.cornerRadius = 2.5
        circle.backgroundColor = green
        
        circle1 = UIView(frame: CGRect(x: 37.0, y: currentStartingYPoint, width: 5.0, height: 5.0))
        circle1.layer.cornerRadius = 2.5
        circle1.backgroundColor = green
        
        circle2 = UIView(frame: CGRect(x: 44.0, y: currentStartingYPoint, width: 5.0, height: 5.0))
        circle2.layer.cornerRadius = 2.5
        circle2.backgroundColor = green
        
        self.view.addSubview(circle)
        self.view.addSubview(circle1)
        self.view.addSubview(circle2)
    }
    
    func initLargeCircles() {
        let red = UIColor(red:0.91, green:0.30, blue:0.24, alpha:1.0)
        
        circleLarge = UIView(frame: CGRect(x: 30.0, y: currentStartingYPoint + 70, width: 15.0, height: 15.0))
        circleLarge.layer.cornerRadius = 7.5
        circleLarge.backgroundColor = red
        
        circle1Large = UIView(frame: CGRect(x: 50.0, y: currentStartingYPoint + 70, width: 15.0, height: 15.0))
        circle1Large.layer.cornerRadius = 7.5
        circle1Large.backgroundColor = red
        
        circle2Large = UIView(frame: CGRect(x: 70.0, y: currentStartingYPoint + 70, width: 15.0, height: 15.0))
        circle2Large.layer.cornerRadius = 7.5
        circle2Large.backgroundColor = red
        
        self.view.addSubview(circleLarge)
        self.view.addSubview(circle1Large)
        self.view.addSubview(circle2Large)
    }
    
    func prepareAnimation() {
        var views: Array<UIView> = Array<UIView>()
        views.append(circle)
        views.append(circle1)
        views.append(circle2)
        
        let animation = TypingLoaderAnimation(viewList: views, resetZeroTo: currentStartingYPoint)
        animation.startAnimation()
    }
    
    func prepareAnimationLarge() {
        var views: Array<UIView> = Array<UIView>()
        views.append(circleLarge)
        views.append(circle1Large)
        views.append(circle2Large)
        
        let animation = TypingLoaderAnimation(viewList: views, resetZeroTo: currentStartingYPoint + 70)
        animation.jump = 14
        animation.startAnimation()
    }
}

