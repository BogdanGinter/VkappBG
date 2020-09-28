//
//  SecondLoginViewController.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 28.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit


class AnimatedViewController: UIViewController {
    
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    var animator = UIViewPropertyAnimator()
    var gestureAnimator = UIViewPropertyAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let offset = abs(regButton.frame.midY - fbButton.frame.midY)
        self.regButton.transform = CGAffineTransform(translationX: 0, y: offset)
        self.fbButton.transform = CGAffineTransform(translationX: 0, y: -offset)
        self.vkImage.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height / 2)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
            self.vkImage.transform = .identity
        }
        
        UIView.animateKeyframes(withDuration: 1,
                                delay: 0,
                                options: .calculationModeCubicPaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.regButton.transform = CGAffineTransform(translationX: 150, y:50)
                                                        self.fbButton.transform = CGAffineTransform(translationX: -150, y: -50)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.regButton.transform = .identity
                                                        self.fbButton.transform = .identity
                                    })
        })
        
        animator.startAnimation(afterDelay: 1)
    }
    
    @IBAction func enterTouch(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            gestureAnimator.startAnimation()
            gestureAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                     dampingRatio: 0.5) {
                                                        self.enterButton.transform = CGAffineTransform(translationX: 0, y: 150)
            }
            gestureAnimator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.view)
            gestureAnimator.fractionComplete = translation.y / 100
        case .ended:
            gestureAnimator.stopAnimation(true)
            gestureAnimator.addAnimations {
                self.enterButton.transform = .identity
            }
            gestureAnimator.startAnimation()
        default: return
        }
    }
    
   
}
