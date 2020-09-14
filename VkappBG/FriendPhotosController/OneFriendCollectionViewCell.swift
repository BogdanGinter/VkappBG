//
//  FriendPhotosCollectionViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit


class OneFriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendOneImage: UIImageView!
    
    var naviController = UINavigationController()
    
    var likeTrigger: Int = 0
    let btn = UIButton(type: .custom)
    let likeLabel = UILabel(frame: CGRect(x: 20, y: 1, width: 30, height: 30))
    
    var scaleLabel: CGAffineTransform
    var scaleCell: CGAffineTransform
    var likesCount: Int = 0
    
    required init(coder: NSCoder){
        scaleLabel = CGAffineTransform(scaleX: 1.2, y: 1.2)
        scaleCell = CGAffineTransform(scaleX: 0, y: 0)
        super.init(coder: coder)!
        
    }
    
    func configView(imgName: String) {
        self.alpha = 0.0
        self.transform = scaleCell
        friendOneImage.image = UIImage(named: imgName)
        
        appearPhoto()
        btn.setImage(UIImage(named: "heart"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.addTarget(self, action: #selector(addLike), for: .touchUpInside)
        addSubview(btn)
        
        
        likeLabel.text = "\(likesCount)"
        likeLabel.font = likeLabel.font.withSize(20)
        likeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        likeLabel.textColor = .red
        addSubview(likeLabel)
        
        
    }
    
    @objc
    func addLike(){
        
        if likeTrigger == 0 {
            btn.setImage(UIImage(named: "like_heart"), for: .normal)
            likeTrigger = 1
            likesCount += 1
            
            UIView.animate(withDuration: 1, animations: {
                self.likeLabel.alpha = 0.0
            })
            
            UIView.animate(withDuration: 0.1, animations: {
                self.likeLabel.text = "\(self.likesCount)"
                self.likeLabel.textColor = .systemGreen
                self.likeLabel.alpha = 1.0
                
            })
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.likeLabel.transform = self.scaleLabel
            }
                , completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.scaleLabel = CGAffineTransform(scaleX: 1, y: 1)
                        self.likeLabel.transform = self.scaleLabel
                    })
            })
            
        }else if likeTrigger == 1 {
            
            btn.setImage(UIImage(named: "heart"), for: .normal)
            likeTrigger = 0
            likesCount -= 1
            likeLabel.text = "\(likesCount)"
            likeLabel.textColor = .red
            
        }
    }
    
    private func appearPhoto() {
        scaleCell = CGAffineTransform(scaleX: 1, y: 1)
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 1.0
            self.transform = self.scaleCell
        })
        
    }
    
}
