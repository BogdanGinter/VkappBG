//
//  User.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class User {
    var name: String
    var age: Int
    var avatarImageName: String
    var photosImageName: [String]
    
    init(name: String,
         age: Int,
         avatarImageName: String,
         photosImageName: [String]) {
        self.name = name
        self.age = age
        self.avatarImageName = avatarImageName
        self.photosImageName = photosImageName
    }
}
