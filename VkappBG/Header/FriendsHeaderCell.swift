//
//  Alert.swift
//  Weather
//
//  Created by Богдан Гинтер on 04.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class FriendsHeaderCell: UITableViewHeaderFooterView {
    

    @IBOutlet weak var headerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
    }
    
}

