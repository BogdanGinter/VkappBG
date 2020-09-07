//
//  Animations.swift
//  VkappBG
//
//  Created by Богдан Гинтер on 07.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class Animations {
    
    public func fadeElement(_ element: UIView, duration: TimeInterval, delay: TimeInterval) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [.curveLinear, .repeat, .autoreverse],
            animations: {
                element.alpha = 0
        },
            completion: nil)
        
    }
    
    public func reactToClickOnAvatar(_ element: UIView) {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.duration = 2.5
        animation.stiffness = 180
        animation.mass = 2
        element.layer.add(animation, forKey: nil)
        
    }
    
    
}
