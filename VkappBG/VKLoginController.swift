//
//  VKLoginController.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 01.10.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class VKLoginController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    let vkRequest = VKRequests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(vkRequest.vkLoginRequest())
        webView.navigationDelegate = self
        
    }
    
}

extension VKLoginController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
     
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = params["access_token"],
              let userId = Int(params["user_id"]!)
        else {
            decisionHandler(.allow)
            return
        }
        
        Session.shared.token = token
        Session.shared.userID = userId
        debugPrint(Session.shared.token, "это токен")
        
        
        
        performSegue(withIdentifier: "VKLogin", sender: nil)
        decisionHandler(.cancel)
        vkRequest.getFriends()
        vkRequest.getGroup()
        
    }
    
}
//3les
