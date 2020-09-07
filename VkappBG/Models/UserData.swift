//
//  User.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

struct FriendList {
    var name: String
    var avatar: UIImage
    var photos: [UIImage] = []
    var titleFirstLetter: String {
        return String(name.first!)
    }
}
