//
//  NewsTableViewCell.swift
//  Weather
//
//  Created by Богдан Гинтер on 07.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageName: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImageName: UIImageView!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var sharesCount: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    
    func config(news: News) {
    
    avatarImageName.image = UIImage(named: news.avatarImageName)
    authorName.text = news.authorName
    date.text = news.date
    
    newsText.text = news.newsText
    newsImageName.image = UIImage(named: news.newsImageName)

    commentsCount.text = "\(news.commentsCount)"
    sharesCount.text = "\(news.sharesCount)"
    viewsCount.text = "\(news.viewsCount)"
    }

}
