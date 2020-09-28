//
//  FriendPhotosCollectionViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    var friendIndex: String = ""
    let photosView = ViewPhotos()
    var currentLikes: Int?
    
    var friendsPhotos: [FriendImages]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosView.friendPhotos = friendsPhotos
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsPhotos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhoto", for: indexPath) as! OneFriendCollectionViewCell
        cell.imgStat = friendsPhotos![indexPath.row]
        cell.configView()

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photosView.friendPhotos = friendsPhotos
        photosView.currentImageIndex = indexPath.row
        self.navigationController!.pushViewController(photosView, animated: true)
    }
    
}
