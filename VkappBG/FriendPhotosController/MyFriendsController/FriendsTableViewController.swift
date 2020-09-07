//
//  MyFriendsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

struct FriendViewItem {
    let letter: String
    let users: [FriendList]
}

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    var friends: [FriendList] = [
        FriendList(name: "Богдан", avatar: UIImage(named: "1")!, photos: [UIImage(named:"1a")!, UIImage(named:"1b")!]),
        FriendList(name: "Марк", avatar: UIImage(named: "2")!, photos: [UIImage(named:"2a")!, UIImage(named:"2b")!]),
        FriendList(name: "Даша", avatar: UIImage(named: "3")!, photos: [UIImage(named:"3a")!, UIImage(named:"3b")!]),
        FriendList(name: "Настя", avatar: UIImage(named: "4")!, photos: [UIImage(named:"4a")!, UIImage(named:"4b")!])
    ]
    
    var sortedList: [FriendViewItem] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortedList = map(input: friends)
        tableView.register(UINib(nibName: "UserHeader", bundle: .none), forHeaderFooterViewReuseIdentifier: "UserHeader")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        
        if text.isEmpty {
            sortedList = map(input: friends)
            
        } else {
            sortedList = map(input: friends.filter{ (friend) -> Bool in
                return friend.name.contains(text)
            })
        }
        tableView.reloadData()
    }
    
    private func map(input: [FriendList]) -> [FriendViewItem] {
        
        let sorted = input.sorted { (u1, u2) -> Bool in
            u1.name < u2.name
        }
        
        var output: [FriendViewItem] = []
        
        var i = 0
        
        while  i < input.count {
            let letter = sorted[i].titleFirstLetter
            var userWithLetter: [FriendList] = []
            
            for element in sorted[i...] {
                if element.titleFirstLetter == letter {
                    userWithLetter.append(element)
                } else {
                    output.append(FriendViewItem(letter: letter, users: userWithLetter))
                    break
                }
            }
            
            i += userWithLetter.count
            
            if i == input.count {
                output.append(FriendViewItem(letter: letter, users: userWithLetter))
            }
        }
        
        return output
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedList[section].users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
            as! FriendsTableViewCell
        let friend = sortedList[indexPath.section].users[indexPath.row]
        cell.config(friends: friend)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendsPhotos" {
            let friendsPhotoCollectionVC = segue.destination as! FriendsPhotoCollectionViewController
            if let index = tableView.indexPathForSelectedRow {
                let friend = friends[index.row]
                friendsPhotoCollectionVC.friendsPhotos = friend.photos
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserHeader") as! UserHeader
        let title = sortedList[section].letter
        view.config(title: title)
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
            switch editingStyle {
            case.delete:
                friends.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            default:
                break
            }
    
        }
    
}
