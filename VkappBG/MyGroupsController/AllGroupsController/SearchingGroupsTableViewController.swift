//
//  AllGroupsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class SearchingGroupsTableViewController: UITableViewController {

   let allGroups: [Group] = [Group(avatar: UIImage(named: "31")!, name: "Уникумы"), Group(avatar: UIImage(named: "32")!, name: "Мозг"), Group(avatar: UIImage(named: "33")!, name: "Власть"), Group(avatar: UIImage(named: "34")!, name: "Спорт")]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath)
        as! SearchingGroupsTableViewCell
        let group = allGroups[indexPath.row]
        cell.config(allGroups: group)
        return cell
    }
}
