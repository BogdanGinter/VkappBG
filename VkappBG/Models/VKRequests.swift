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
    

  
  func getGroup() {
      var urlComponents = URLComponents()
      urlComponents.scheme = "https"
      urlComponents.host = "api.vk.com"
      urlComponents.path = "/method/groups.get"
      urlComponents.queryItems = [
          URLQueryItem(name: "user_ids", value: "7614944"),
          URLQueryItem(name: "access_token", value: Session.shared.token),
          URLQueryItem(name: "extended", value: "1"),
          URLQueryItem(name: "v", value: "5.68")
      ]
      AF.request(urlComponents.url!).responseJSON { response in
          print(response)
      }
  }
  
  func getFriends() {
      var urlComponents = URLComponents()
      urlComponents.scheme = "https"
      urlComponents.host = "api.vk.com"
      urlComponents.path = "/method/friends.get"
      urlComponents.queryItems = [
          URLQueryItem(name: "user_ids", value: "7614944"),
          URLQueryItem(name: "access_token", value: Session.shared.token),
          URLQueryItem(name: "fields", value: "domain"),
          URLQueryItem(name: "v", value: "5.68")
          
      ]
      
      AF.request(urlComponents.url!).responseJSON { response in
          print(response)
      }
  }

}
    

//3l
