//
//  Friends.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 14.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import Foundation

struct Friends {
    let name: String
    let mainPic: String
    let pics: [String]?
    var firstLetter: String { return String(name.first!)}
    let about: String?
}
