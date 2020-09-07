//
//  NewsData.swift
//  Weather
//
//  Created by Богдан Гинтер on 07.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

struct News {

let avatarImageName: String
let authorName: String
let date: String = "Today 19:19"
let newsText: String
let newsImageName: String

var commentsCount: Int = Int.random(in: 0...100)
var sharesCount: Int = Int.random(in: 0...150)
var viewsCount: Int = Int.random(in: 50...1000)
}
