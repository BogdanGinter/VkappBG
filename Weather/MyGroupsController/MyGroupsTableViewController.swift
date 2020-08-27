//
//  MyGroupsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    var groups = [Group]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let group1 = Group(name: "Bart's friends",
                           avatarImageName: "BartsFriends")
        
        let group2 = Group(name: "Simpsons Fan",
                           avatarImageName: "SimpsonsFan")
        
        
        
        groups = [group1, group2]
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell",
                                                 for: indexPath) as! MyGroupsTableViewCell
        let group = groups[indexPath.row]
        cell.myGroupsNameLabel.text = group.name
        cell.myGroupsPhotoImageView.image = UIImage(named: group.avatarImageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addGroups(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroups" {
            let allGroupsTableViewController = segue.source as! AllGroupsTableViewController
            
            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {
                let allGroups = allGroupsTableViewController.groups
                let group = allGroups[indexPath.row]
                if !groups.contains(group) {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
