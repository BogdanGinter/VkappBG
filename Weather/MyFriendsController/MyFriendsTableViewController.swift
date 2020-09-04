//
//  MyFriendsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homer = User(name: "Homer Simpson",
                         age: 39,
                         avatarImageName: "homer_simpson_avatar",
                         photosImageName: ["homer_simpson_avatar", "HomerSimpson1"])
        
        let marge = User(name: "Marge Simpson",
                         age: 37,
                         avatarImageName: "marge_simpson_avatar",
                         photosImageName: ["MargeSimpson1", "MargeSimpson2"])
        
        let bart = User(name: "Bart Simpson",
                        age: 10,
                        avatarImageName: "bart_simpson_avatar",
                        photosImageName: ["BartSimpson1", "BartSimpson2"])
        
        let lisa = User(name: "Lisa Simpson",
                        age: 8,
                        avatarImageName: "lisa_simpson_avatar",
                        photosImageName: ["LisaSimpson1", "LisaSimpson2"])
        
        let maggie = User(name: "Maggie Simpson",
                          age: 1,
                          avatarImageName: "maggie_simpson_avatar",
                          photosImageName: ["MaggieSimpson1", "MaggieSimpson2"])
        
        users = [homer, marge, bart, lisa, maggie]
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int { users.count }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell",
                                                 for: indexPath) as! MyFriendsTableViewCell
        let user = users[indexPath.row]
        
        cell.friendNameLabel.text = user.name
        cell.friendProfilePhotoImageView.image = UIImage(named: user.avatarImageName)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "segueShowPhotos" {
            guard let viewController = segue.destination as? FriendPhotosCollectionViewController,
                let selectedIndexPath = tableView.indexPathForSelectedRow else {
                    return
            }
            let user = users[selectedIndexPath.row]
            viewController.user = user
        }
    }
}
