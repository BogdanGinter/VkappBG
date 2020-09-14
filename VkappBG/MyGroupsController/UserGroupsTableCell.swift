//
//  MyGroupsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class UserGroupsTableCell: UITableViewCell {

    @IBOutlet weak var userGroupsLabel: UILabel!
    @IBOutlet weak var userGroupsIcon: UIImageView!
    
    func configCell(groupData: GroupsData) {
        
        userGroupsLabel.text = groupData.name
        userGroupsIcon.image = UIImage(named: groupData.pic!)
        
    }

}
