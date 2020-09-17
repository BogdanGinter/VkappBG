//
//  ViewPhotos.swift
//  VkappBG
//
//  Created by Bogdan Ginter on 14.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class ViewPhotos: UIViewController {

    let mainView = MainView()
    var friendPhotos: [FriendImages]? = []
    var currentImageIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.currentImageIndex = currentImageIndex
        mainView.friendPhotos = friendPhotos ?? []
        mainView.setup()
    }
    
}
