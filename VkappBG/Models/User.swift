//
//  User.swift
//  Weather
//
//  Created by Богдан Гинтер on 27.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//


import Foundation

class Friend: Decodable {
   var firstNamne: String = ""
   var lastName: String = ""
   var online: Int = 0
   var photo100: String = ""
   var id: Int = 0
   var sex: Int = 0
}
class FriendList: Decodable {
   var response: [Friend]
}
//3les
