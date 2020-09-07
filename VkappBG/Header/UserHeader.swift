//
//  Alert.swift
//  Weather
//
//  Created by Богдан Гинтер on 04.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class UserHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!

    func config(title: String) {
        titleLabel.text = title
        titleLabel.textColor = .blue
    }

}

