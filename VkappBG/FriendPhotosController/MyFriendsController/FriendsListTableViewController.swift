//
//  MyFriendsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

struct FriendsFullData {
    let letter: String?
    let friendData: [Friends]
}

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    var friends: [FriendList] = [
        FriendList(name: "Богдан", avatar: UIImage(named: "1")!, photos: [UIImage(named:"1a")!, UIImage(named:"1b")!]),
        FriendList(name: "Марк", avatar: UIImage(named: "2")!, photos: [UIImage(named:"2a")!, UIImage(named:"2b")!]),
        FriendList(name: "Даша", avatar: UIImage(named: "3")!, photos: [UIImage(named:"3a")!, UIImage(named:"3b")!]),
        FriendList(name: "Настя", avatar: UIImage(named: "4")!, photos: [UIImage(named:"4a")!, UIImage(named:"4b")!])
    ]
    

        var searchedFriends: [Friends] = []
        
        var sortedFriendsData: [FriendsFullData] = []
        
        var rootFriendIndex: Int? = nil
        
        override func viewDidLoad() {
            super.viewDidLoad()
            searchedFriends = myFriends
            let searchBar: UISearchBar = UISearchBar()
            searchBar.searchBarStyle = UISearchBar.Style.prominent
            searchBar.placeholder = " Поиск..."
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.delegate = self
            tableView.tableHeaderView = searchBar
            
            tableView.backgroundColor = #colorLiteral(red: 0.02839463949, green: 0.8947911859, blue: 1, alpha: 1)
            tableView.register(UINib(nibName: "FriendsHeaderCell", bundle: .none), forHeaderFooterViewReuseIdentifier: "FriendCell")
            
            sortedFriendsData = map(friends: searchedFriends)
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            guard let text = searchBar.text else { return }
            
            if text.isEmpty {
                searchedFriends = myFriends
            } else {
                
                searchedFriends = myFriends.filter({ (friend) -> Bool in
                    return friend.name.contains(text)
                })
            }
            sortedFriendsData = map(friends: searchedFriends)
            tableView.reloadData()
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sortedFriendsData[section].friendData.count
        }
        
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendCell") as! FriendsHeaderCell
            
            let headerTitle = sortedFriendsData[section].letter
            view.headerLabel.text = headerTitle
            return view
        }
        
        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        
        private func map(friends: [Friends]) -> [FriendsFullData] {
            
            var outputFriends: [FriendsFullData] = []
            
            let sortedFriends = friends.sorted{(u1, u2) -> Bool in u1.name < u2.name}
            
            var lastOfLetter: String = ""
            var friendsOfLetter: [Friends] = []
            var i: Int = 0
            for oneFriend in sortedFriends {
                i += 1
                if lastOfLetter == "" {
                    lastOfLetter = oneFriend.firstLetter
                }
                
                if lastOfLetter == oneFriend.firstLetter {
                    friendsOfLetter.append(oneFriend)
                } else {
                    outputFriends.append(FriendsFullData(letter: lastOfLetter, friendData: friendsOfLetter))
                    friendsOfLetter = []
                    friendsOfLetter.append(oneFriend)
                    
                }
                
                if i == sortedFriends.count {
                    outputFriends.append(FriendsFullData(letter: oneFriend.firstLetter, friendData: friendsOfLetter))
                }
                lastOfLetter = oneFriend.firstLetter
                
            }
            
            return outputFriends
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! FriendsOneCellController
            
            let currentFriend = sortedFriendsData[indexPath.section].friendData[indexPath.row]
            cell.configCell(oneFriend: currentFriend)
            
            return cell
        }
        
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            
            self.rootFriendIndex = indexPath.row
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "FriendsPhotoCollectionViewControllerID") as! FriendsPhotoCollectionViewController
            vc.friendsPhotos = sortedFriendsData[indexPath.section].friendData[indexPath.row].pics ?? []
            self.navigationController?.pushViewController(vc, animated:true)
            
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return sortedFriendsData.count
        }
        
        
        
    }
