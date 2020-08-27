//
//  Groups.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class Group {
    var name: String
    var avatarImageName: String
    
    init(name: String,
         avatarImageName: String) {
        self.name = name
        self.avatarImageName = avatarImageName
    }
}

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}
