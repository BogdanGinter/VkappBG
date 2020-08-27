//
//  AllGroupsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let group1 = Group(name: "Bart's friends",
                           avatarImageName: "BartsFriends")
        
        let group2 = Group(name: "Simpsons Fan",
                           avatarImageName: "SimpsonsFan")
        
        let group3 = Group(name: "Springfield Life",
                           avatarImageName: "SpringfieldLife")
        
        let group4 = Group(name: "Springfield School",
                           avatarImageName: "SpringfieldSchool")
        
        
        groups = [group1, group2, group3, group4]
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int { groups.count }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell",
                                                 for: indexPath) as! AllGroupsTableViewCell
        let group = groups[indexPath.row]
        cell.allGroupsNameLabel.text = group.name
        cell.allGroupsPhotoImageView.image = UIImage(named: group.avatarImageName)
        return cell
    }
}
