//
//  AvatarView.swift
//  Weather
//
//  Created by Богдан Гинтер on 04.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

@IBDesignable class AvatarShadow: UIView {

   @IBInspectable var color: UIColor = .black {
       didSet {
           self.updateColors()
       }
   }
   
   @IBInspectable var opacity: CGFloat = 1 {
       didSet {
           self.updateOpacity()
       }
   }
   
   @IBInspectable var radius: CGFloat = 50 {
       didSet {
           self.updateRadius()
       }
   }
   
   @IBInspectable var offset: CGSize = .zero {
       didSet {
           self.updateOffset()
       }
   }

   override class var layerClass: AnyClass {
       return CAShapeLayer.self
   }
   
   
   var shadowLayer: CAShapeLayer {
       return self.layer as! CAShapeLayer
   }
   
   
   func updateColors() {
       self.shadowLayer.shadowColor = self.color.cgColor
   }
   
   func updateOpacity() {
       self.shadowLayer.shadowOpacity = Float(self.opacity)
   }
   
   func updateRadius() {
       self.shadowLayer.shadowRadius = self.radius
   }
   
   func updateOffset() {
       self.shadowLayer.shadowOffset = offset
   }

}
