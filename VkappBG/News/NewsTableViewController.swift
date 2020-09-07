//
//  NewsTableViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 07.09.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

var news: [News] = [
        News(avatarImageName: "1", authorName: "Богдан", newsText: "Присоединяйтесь!", newsImageName: "1a"),
        News(avatarImageName: "2", authorName: "Марк", newsText: "Гуляем!", newsImageName: "2b")]
        

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableViewCell
        let newsModel = news[indexPath.row]
        cell.config(news: newsModel)
        return cell
    }
}
