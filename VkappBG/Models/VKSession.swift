//
//  VKSession.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 28.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//


import Foundation

class Session {
    public static let shared = Session()
    
    var token: String = ""
    var userID: Int = 0
    
    private init() {}
}
