//
//  FriendPhotosCollectionViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit


class FriendsPhotoCollectionViewController: UICollectionViewController {

    var friendsPhotos = [UIImage] ()

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCollectionCell", for: indexPath) as! FriendsPhotoCollectionViewCell
        cell.photo.image = friendsPhotos[indexPath.row]
        return cell
    }

}

