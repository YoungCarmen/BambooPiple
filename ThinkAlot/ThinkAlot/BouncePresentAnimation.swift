//
//  BouncePresentAnimation.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

class BouncePresentAnimation: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {

    var startFrame: CGRect?
    var finalFrame: CGRect?
    var transitionContext: UIViewControllerContextTransitioning!
    var isPositive: Bool = false
    
    init(start: CGRect, end: CGRect, isPositive: Bool) {
        super.init()
        startFrame = start
        finalFrame = end
        self.isPositive = isPositive
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
        transitionContext.containerView.addSubview(toVC!.view)
        transitionContext.containerView.addSubview(fromVC!.view)
        
        let bezierPath = UIBezierPath(rect: startFrame!)
        let bezierFinalPath = UIBezierPath(rect: finalFrame!)
        
        let shapLayer = CAShapeLayer()
        shapLayer.path = bezierFinalPath.cgPath
        if isPositive{
            fromVC?.view.layer.mask = shapLayer
        }else{
            toVC?.view.layer.mask = shapLayer
            transitionContext.containerView.exchangeSubview(at: 1, withSubviewAt: 0)
        }
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = bezierPath.cgPath
        animation.toValue = bezierFinalPath.cgPath
        animation.fillMode = kCAFillModeBoth
        animation.duration = transitionDuration(using: transitionContext)
        animation.delegate = self
        shapLayer.add(animation, forKey: "path")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        self.transitionContext.completeTransition(!self.transitionContext.transitionWasCancelled)
        self.transitionContext.viewController(forKey: .to)?.view.layer.mask = nil
    }
}
