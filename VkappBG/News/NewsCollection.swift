//
//  NewsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 07.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NewsCell"

class NewsCollection: UICollectionViewController {
    
    var myFriends = [
        Friends(name: "Bogdan", mainPic: "1", pics: [FriendImages(name: "1"), FriendImages(name: "1a"), FriendImages(name: "1b")], about: "123"),
        Friends(name: "Mark", mainPic: "ford1", pics: [FriendImages(name: "ford1"), FriendImages(name: "2"), FriendImages(name: "2a"), FriendImages(name: "2b")], about: "456"),
        Friends(name: "Daria", mainPic: "3", pics: [FriendImages(name: "3"), FriendImages(name: "3a"), FriendImages(name: "3b")], about: "789"),
   
    ]
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NewsCell", bundle: .none), forCellWithReuseIdentifier: "NewsCell")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFriends.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
        cell.configCell(currentFriend: myFriends[indexPath.row])

   
        return cell
    }
    
}
