//
//  AllGroupsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class SearchingGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchingGroupsAvatar: UIImageView!
    @IBOutlet weak var searchingGroupsName: UILabel!
    
    func config(allGroups: Group) {
        searchingGroupsAvatar.image = allGroups.avatar
        searchingGroupsName.text = allGroups.name
    }
}

