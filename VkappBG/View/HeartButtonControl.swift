//
//  CustomButton.swift
//  Weather
//
//  Created by Богдан Гинтер on 04.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

@IBDesignable class HeartButtonControl: UIStackView {
    
    let button = UIButton()
    var textLabel = UILabel()
    
    var state = false{
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    var likeCounter = Int.random(in: 1...100) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var heartSize: CGSize = CGSize(width: 20.0, height: 20.0){
        didSet {
            setupButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        
        let filledHeart = UIImage(named: "Heart-1")
        let emptyHeart = UIImage(named:"heart")
        
        textLabel.backgroundColor = UIColor.white
        textLabel.text  = "\(likeCounter)"
        textLabel.textAlignment = .center
        
        button.setImage(emptyHeart, for: .normal)
        button.setImage(filledHeart, for: .selected)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: heartSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: heartSize.width).isActive = true
        
        button.addTarget(self, action: #selector(HeartButtonControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        addArrangedSubview(textLabel)
        addArrangedSubview(button)
        
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        state = !state
        UIView.transition(with: textLabel, duration: 0.3, options: .transitionFlipFromBottom, animations: {
            self.likeCounter = self.state ? self.likeCounter + 1 : self.likeCounter - 1
            self.textLabel.textColor = self.state ? .blue : .black
        })
    }
    
    private func updateButtonSelectionStates() {
        button.isSelected = state
        
    }
    
}
