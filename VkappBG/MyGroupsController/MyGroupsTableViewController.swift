//
//  MyGroupsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    @IBAction func groupSearching(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchingGroupsTableVC = storyboard.instantiateViewController(identifier: "SearchingGroupsTableViewControllerID")
        navigationController?.pushViewController(searchingGroupsTableVC, animated: true)
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let searchingGroupsTableViewController = segue.source as? SearchingGroupsTableViewController else { return }
            if let indexPath = searchingGroupsTableViewController.tableView.indexPathForSelectedRow {
                let group = searchingGroupsTableViewController.allGroups[indexPath.row]
            if !myGroups.contains(group) {
                    myGroups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }
    
    var myGroups: [Group] = [Group(avatar: UIImage(named: "21")!, name: "Интеллект"), Group(avatar: UIImage(named: "22")!, name: "Своими руками"), Group(avatar: UIImage(named: "23")!, name: "IT"), Group(avatar: UIImage(named: "24")!, name: "Картинки")]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath)
        as! MyGroupsTableViewCell
        let group = myGroups[indexPath.row]
        cell.config(myGroups: group)
        return cell
    }
}
