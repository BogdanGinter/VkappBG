//
//  FriendPhotosCollectionViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class FriendPhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var friendPhotoImageView: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var subscribeCounter = 0
    
    func checkSubscribers() {
        if likeBtn.tag == 0 {
            likeBtn.setImage(UIImage(named: "heart"), for: .normal)
            subscribeCounter += 1
            likeCountLabel.text = "\(subscribeCounter)"
            likeBtn.tag = 1
        } else {
            likeBtn.setImage(UIImage(named: "heart-2"), for: .normal)
            subscribeCounter -= 1
            likeCountLabel.text = "\(subscribeCounter)"
            likeBtn.tag = 0
        }
        
        guard subscribeCounter == 0 else { return likeCountLabel.textColor = .red }
        likeCountLabel.textColor = .blue
    }
    
    //MARK: IB Actions
    @IBAction func likeBtnClicked(_ sender: UIButton) {
        checkSubscribers()
    }
}

