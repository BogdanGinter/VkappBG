//
//  MyGroupsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var myGroupsAvatar: UIImageView!
    @IBOutlet weak var myGroupsName: UILabel!
    
    func config(myGroups: Group) {
        myGroupsAvatar.image = myGroups.avatar
        myGroupsName.text = myGroups.name
    }
}
