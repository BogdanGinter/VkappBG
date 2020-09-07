//
//  MyFriendsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatar.layer.borderColor = UIColor.black.cgColor
        avatar.layer.borderWidth = 2
        avatar.layer.masksToBounds = true
    }
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shadow: UIView!
    
    func config(friends: FriendList) {
        avatar.image = friends.avatar
        name.text = friends.name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.bounds.height / 2
        shadow.layer.cornerRadius = shadow.bounds.height / 2
    }
    
}
