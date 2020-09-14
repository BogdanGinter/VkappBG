//
//  MyFriendsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//


import UIKit

class FriendsOneCellController: UITableViewCell {
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var friendLabel: UILabel!
    
    
    func configCell(oneFriend: Friends) {
        self.backgroundColor = .clear
        friendLabel.text = oneFriend.name
        avatarView.shadowSubView()
        avatarView.avatarImage(imgname: oneFriend.mainPic)

    }

}
