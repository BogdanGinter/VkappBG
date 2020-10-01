//
//  VKRequests.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 01.10.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import Alamofire


class VKRequests {
    
    func vkLoginRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7614944"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "0"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)
        
        
        return request
        
    }
    
    
    
}
